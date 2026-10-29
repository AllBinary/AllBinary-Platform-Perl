# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

#FileJ2SE should be the same as J2SEForJ2ME
package org::allbinary::logic::io::file::AbFileSystem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::AbFileSystem'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::AbFileSystem::instance;
}


sub isDirectoryOrFile {
    my ($self, $path) = @_;
        my $file = 'java::io::File'->new($path);
        return $file->isDirectory() || $file->isFile();
}


sub isDirectory {
    my ($self, $path) = @_;
        return 'java::io::File'->new($path)->isDirectory();
}


sub getFilesAsStringArrayForPath {
    my ($self, $currentDirPath) = @_;
        my $file = 'java::io::File'->new($currentDirPath);
        if ($file->exists()) {
            return $file->list();
        } else {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance();
        }
}


sub readAsString {
    my ($self, $fileName) = @_;
        my $bytes = [(0) x (1000000)];
        return $self->readAsString($fileName, $bytes);
}


# Java overloaded method: Perl keeps the last definition
sub readAsString {
    my ($self, $fileName, $bytes) = @_;
        my $closeable = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
        try {
            my $idFile = 'java::io::FileInputStream'->new($fileName);
            $closeable = $idFile;
            my $size = $idFile->read($bytes);
            if ($size > 0) {
                return pack("C*", @{$bytes, 0, $size});
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "readAsString", $e);
        } finally {
            $self->close($closeable);
        }
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub close {
    my ($self, $closeable) = @_;
        try {
            if (defined($closeable)) {
                my $inputStream = ($closeable);
                $inputStream->close();
            }
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CLOSE}, $e);
            return 0;
        }
}

use java::io::File;
# use java::io::FileInputStream;
# use java::io::InputStream;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;

