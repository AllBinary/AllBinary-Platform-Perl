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

package org::allbinary::logic::io::file::FileLockUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::FileLockUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileLockUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getAll {
    my ($self, $vector, $isReturnOnFailure) = @_;
        my $fileLockVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $file = $vector->get($index);
            my $fileLock = $self->getLock($file);
            if (defined($fileLock)) {
                $self->{logUtil}->putF("File Lock Obtained: " . $file->getAbsolutePath(), $self, "getAll");
                $fileLockVector->add($fileLock);
            } elsif ($isReturnOnFailure) {
                $self->{logUtil}->putF("Total Locks Obtained: " . $fileLockVector->size(), $self, "getAll");
                return $fileLockVector;
            }
        }
        $self->{logUtil}->putF("Total Locks Obtained: " . $fileLockVector->size(), $self, "getAll");
        return $fileLockVector;
}


# throws Exception
sub getAllPossible {
    my ($self, $vector) = @_;
        return $self->getAll($vector, 0);
}


# throws Exception
sub getAllOrNone {
    my ($self, $vector) = @_;
        my $fileLockVector = $self->getAll($vector, 1);
        if ($vector->size() != $fileLockVector->size()) {
            return 'org::allbinary::util::BasicArrayListD'->new();
        } else {
            return $fileLockVector;
        }
}


# throws Exception
sub getLock {
    my ($self, $file) = @_;
        try {
            return $self->getLock('org::allbinary::logic::io::AbFileOutputStream'->createFromAbFileAppend($file, 1));
        } catch ($e) {
            $self->{logUtil}->put("Exception returns null", $self, "getLock", $e);
            return undef;
        } finally {
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getLock {
    my ($self, $fileOutputStream) = @_;
        try {
            my $fileLock = $self->getLock($fileOutputStream->getChannel());
            return $fileLock;
        } catch ($e) {
            $self->{logUtil}->put("Exception returns null", $self, "getLock", $e);
            return undef;
        } finally {
            $self->{logUtil}->putF("Finally - Closing FileOutputStream", $self, "getLock");
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($fileOutputStream);
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getLock {
    my ($self, $fileChannel) = @_;
        try {
            my $fileLock = $fileChannel->tryLock();
            return $fileLock;
        } catch ($e) {
            $self->{logUtil}->put("Exception returns null", $self, "getLock", $e);
            return undef;
        } finally {
            $self->{logUtil}->putF("Finally - Closing FileChannel", $self, "getLock");
            $fileChannel->close();
        }
}

# use java::nio::channels::FileChannel;
# use java::nio::channels::FileLock;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbFileOutputStream;
use org::allbinary::logic::io::StreamUtil;

1;

