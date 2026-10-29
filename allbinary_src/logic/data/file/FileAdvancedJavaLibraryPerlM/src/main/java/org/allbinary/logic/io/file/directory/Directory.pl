#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::io::file::directory::Directory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::directory::Directory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::directory::Directory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub create {
    my ($self, $directoryAbPath) = @_;
        return $self->create($directoryAbPath->toFileSystemString());
}


# throws Exception
sub remove {
    my ($self, $existingDirectoryAbPath) = @_;
        $self->remove($existingDirectoryAbPath->toFileSystemString());
}


# Java overloaded method: Perl keeps the last definition
sub create {
    my ($self, $directory) = @_;
        try {
            my $directoryFile = 'org::allbinary::logic::io::file::FileFactory'->getInstance()->getInstance($directory);
            if (!$directoryFile->isDirectory()) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("Creating Directories: " . $directory, $self, "create");
                if (!$directoryFile->mkdirs()) {
                    return 0;
                }
            }
            return 1;
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("Error Creating Directories: " . $directory, $self, "create", $e);
            return 0;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub remove {
    my ($self, $existingDirectory) = @_;
        my $existingDirectoryFile = 'org::allbinary::logic::io::file::FileFactory'->getInstance()->getInstance($existingDirectory);
        if ($existingDirectoryFile->isDirectory()) {
            if (scalar(@{$existingDirectoryFile->list()}) > 0) {
                die ("Did not remove category: " . $existingDirectory . " because files exist");
            } elsif ($existingDirectoryFile->delete()) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("Successfully Removed: " . $existingDirectory, "Directory", "remove");
            }
        } else {
            die ("Category Directory Is Missing:" . $existingDirectory);
        }
}


sub search {
    my ($self, $fileFilter, $file) = @_;
        return $self->search($fileFilter, $file, 0);
}


# Java overloaded method: Perl keeps the last definition
sub search {
    my ($self, $fileFilter, $file, $isRecursiveSearch) = @_;
        my $fileList = 'org::allbinary::util::BasicArrayListD'->new();
        my $recursiveFileList = undef;
        if ($file->isDirectory()) {
            my $fileArray = $file->listFilesFileFilter($fileFilter);
            if (!defined($fileArray)) {
                return $fileList;
            }
            my $files = 'org::allbinary::logic::io::file::FileWrapperUtil'->wrapFiles($fileArray);
            if (!defined($files)) {
                return $fileList;
            }
            my $size = scalar(@{$files});
            for (my $index = 0; $index < $size; $index++) {
                $fileList->add($files->[$index]);
                if ($isRecursiveSearch) {
                    $recursiveFileList = $self->search($fileFilter, $files->[$index], $isRecursiveSearch);
                    $fileList->addAllList($recursiveFileList);
                }
            }
        }
        return $fileList;
}


# Java overloaded method: Perl keeps the last definition
sub search {
    my ($self, $file) = @_;
        return $self->search($file, 0);
}


# Java overloaded method: Perl keeps the last definition
sub search {
    my ($self, $file, $isRecursiveSearch) = @_;
        my $fileList = 'org::allbinary::util::BasicArrayListD'->new();
        my $recursiveFileList = undef;
        if ($file->isDirectory()) {
            my $fileArray = $file->listFiles();
            if (!defined($fileArray)) {
                return $fileList;
            }
            my $files = 'org::allbinary::logic::io::file::FileWrapperUtil'->wrapFiles($fileArray);
            if (!defined($files)) {
                return $fileList;
            }
            for (my $index = 0; $index < scalar(@{$files}); $index++) {
                $fileList->add($files->[$index]);
                if ($isRecursiveSearch) {
                    $recursiveFileList = $self->search($files->[$index], $isRecursiveSearch);
                    $fileList->addAllList($recursiveFileList);
                }
            }
        }
        return $fileList;
}


# Java overloaded method: Perl keeps the last definition
sub search {
    my ($self, $searchValue, $file) = @_;
        return $self->search($searchValue, $file, 0);
}


# Java overloaded method: Perl keeps the last definition
sub search {
    my ($self, $searchValue, $file, $isRecursiveSearch) = @_;
        my $fileList = 'org::allbinary::util::BasicArrayListD'->new();
        my $recursiveFileList = undef;
        if ($file->isDirectory()) {
            my $fileArray = $file->listFiles();
            if (!defined($fileArray)) {
                return $fileList;
            }
            my $files = 'org::allbinary::logic::io::file::FileWrapperUtil'->wrapFiles($fileArray);
            if (!defined($files)) {
                return $fileList;
            }
            for (my $index = 0; $index < scalar(@{$files}); $index++) {
                if ($files->[$index]->getPath()->indexOf($searchValue) >= 0) {
                    $fileList->add($files->[$index]);
                }
                if ($isRecursiveSearch) {
                    $recursiveFileList = $self->search($searchValue, $files->[$index], $isRecursiveSearch);
                    $fileList->addAllList($recursiveFileList);
                }
            }
        }
        return $fileList;
}


# Java overloaded method: Perl keeps the last definition
sub search {
    my ($self, $level, $file) = @_;
        return $self->search($level, $file, 0);
}


# Java overloaded method: Perl keeps the last definition
sub search {
    my ($self, $level, $file, $isRecursiveSearch) = @_;
        my $fileList = 'org::allbinary::util::BasicArrayListD'->new();
        my $recursiveFileList = undef;
        if ($file->isDirectory()) {
            my $fileArray = $file->listFiles();
            if (!defined($fileArray)) {
                return $fileList;
            }
            my $files = 'org::allbinary::logic::io::file::FileWrapperUtil'->wrapFiles($fileArray);
            if (!defined($files)) {
                return $fileList;
            }
            for (my $index = 0; $index < scalar(@{$files}); $index++) {
                $fileList->add($files->[$index]);
                if ($level <= 0) {
                    return $fileList;
                }
                $recursiveFileList = $self->search($level - 1, $files->[$index], $isRecursiveSearch);
                $fileList->addAllList($recursiveFileList);
            }
        }
        return $fileList;
}

# use java::io::FileFilter;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileFactory;
use org::allbinary::logic::io::file::FileWrapperUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

