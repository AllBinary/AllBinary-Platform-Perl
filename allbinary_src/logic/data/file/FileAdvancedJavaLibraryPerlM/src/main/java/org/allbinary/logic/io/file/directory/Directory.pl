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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::file::directory::Directory'->new() };


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::directory::Directory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub create_j1_1 {
    my ($self, $directoryAbPath) = @_;
        return $self->create($directoryAbPath->toFileSystemString());
}


# throws Exception
sub remove_j1_1 {
    my ($self, $existingDirectoryAbPath) = @_;
        $self->remove($existingDirectoryAbPath->toFileSystemString());
}


sub create_j1_2 {
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

sub create {
    my ($invocant, @arguments) = @_;
    return $invocant->create_j1(@arguments) if scalar(@arguments) == 1;
    die "No method create takes " . scalar(@arguments) . " arguments";
}

sub create_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->create_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->create_j1_2(@arguments);
}


# throws Exception
sub remove_j1_2 {
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

sub remove {
    my ($invocant, @arguments) = @_;
    return $invocant->remove_j1(@arguments) if scalar(@arguments) == 1;
    die "No method remove takes " . scalar(@arguments) . " arguments";
}

sub remove_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->remove_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->remove_j1_2(@arguments);
}


sub search_j2_1 {
    my ($self, $fileFilter, $file) = @_;
        return $self->search($fileFilter, $file, 0);
}


sub search_j3_1 {
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


sub search_j1 {
    my ($self, $file) = @_;
        return $self->search($file, 0);
}


sub search_j2_2 {
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


sub search_j2_3 {
    my ($self, $searchValue, $file) = @_;
        return $self->search($searchValue, $file, 0);
}


sub search_j3_2 {
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


sub search_j2_4 {
    my ($self, $level, $file) = @_;
        return $self->search($level, $file, 0);
}


sub search_j3_3 {
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

sub search {
    my ($invocant, @arguments) = @_;
    return $invocant->search_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->search_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->search_j1(@arguments) if scalar(@arguments) == 1;
    die "No method search takes " . scalar(@arguments) . " arguments";
}

sub search_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->search_j2_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->search_j2_2(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]);
    return $invocant->search_j2_3(@arguments) if 1 && !ref($arguments[0]) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->search_j2_4(@arguments);
}

sub search_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->search_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && !ref($arguments[2]);
    return $invocant->search_j3_2(@arguments) if 1 && !ref($arguments[0]) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && !ref($arguments[2]);
    return $invocant->search_j3_3(@arguments);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::FileFilter ();
use org::allbinary::logic::communication::log::PreLogUtil ();
use org::allbinary::logic::io::file::AbFile ();
use org::allbinary::logic::io::file::FileFactory ();
use org::allbinary::logic::io::file::FileWrapperUtil ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();

1;

