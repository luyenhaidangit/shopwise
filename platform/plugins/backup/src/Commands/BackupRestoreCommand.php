<?php

namespace Botble\Backup\Commands;

use BaseHelper;
use Botble\Backup\Supports\Backup;
use Exception;
use Illuminate\Support\Facades\File;
use Illuminate\Console\Command;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputOption;

#[AsCommand('cms:backup:restore', 'Restore a backup')]
class BackupRestoreCommand extends Command
{
    public function handle(Backup $backupService): int
    {
        try {
            if ($this->option('backup')) {
                $backup = $this->option('backup');

                if (! File::isDirectory($backupService->getBackupPath($backup))) {
                    $this->error('Cannot found backup folder!');

                    return self::FAILURE;
                }
            } else {
                $backups = BaseHelper::scanFolder($backupService->getBackupPath());

                if (empty($backups)) {
                    $this->error('No backup found to restore!');

                    return self::FAILURE;
                }

                $backup = Arr::first($backups);
            }

            $this->info('Restoring backup...');

            $path = $backupService->getBackupPath($backup);
            foreach (BaseHelper::scanFolder($path) as $file) {
                if (Str::contains(basename($file), 'database')) {
                    $this->info('Restoring database...');
                    $backupService->restoreDatabase($path . DIRECTORY_SEPARATOR . $file, $path);
                }

                if (Str::contains(basename($file), 'storage')) {
                    $this->info('Restoring uploaded files...');
                    $pathTo = config('filesystems.disks.public.root');
                    $backupService->cleanDirectory($pathTo);
                    $backupService->extractFileTo($path . DIRECTORY_SEPARATOR . $file, $pathTo);
                }
            }

            $this->call('cache:clear');

            do_action(BACKUP_ACTION_AFTER_RESTORE, BACKUP_MODULE_SCREEN_NAME, request());

            $this->info(trans('plugins/backup::backup.restore_backup_success'));
        } catch (Exception $exception) {
            $this->error($exception->getMessage());
        }

        return self::SUCCESS;
    }

    protected function configure(): void
    {
        $this->addOption('backup', null, InputOption::VALUE_REQUIRED, 'The backup date');
    }
}
