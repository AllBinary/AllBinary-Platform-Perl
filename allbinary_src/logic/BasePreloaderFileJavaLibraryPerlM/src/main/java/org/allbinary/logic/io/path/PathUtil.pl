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

#Used to correct user input for paths
package org::allbinary::logic::io::path::PathUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::path::PathUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{abPathData} = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
    $self->{filePathData} = 'org::allbinary::logic::io::file::FilePathData'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::path::PathUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getExtensionWithAbFilePath {
    my ($self, $abFilePath) = @_;
        return $self->{abPathData}->getExtension($abFilePath->toString());
}


sub getExtensionWithAbPath {
    my ($self, $abPath) = @_;
        return $self->{abPathData}->getExtension($abPath->toString());
}


# throws Exception
sub getWithoutExtensionWithAbFilePath {
    my ($self, $abFilePath) = @_;
        return $self->getWithoutExtension($abFilePath->toString());
}


# throws Exception
sub getWithoutExtensionWithAbPath {
    my ($self, $abPath) = @_;
        return $self->getWithoutExtension($abPath->toString());
}


# throws Exception
sub getWithoutExtension {
    my ($self, $filePath) = @_;
        my $indexOfFileExtensionDelmiter = $self->{abPathData}->getExtensionIndex($filePath);
        my $pathWithoutExtension = $filePath;
        if ($indexOfFileExtensionDelmiter >= 0) {
            $pathWithoutExtension = substr($filePath, 0, ($indexOfFileExtensionDelmiter) - (0));
        }
        return $pathWithoutExtension;
}


sub isValid {
    my ($self, $path) = @_;
        if ($self->isValidStart($path)) {
            if ($self->isValidEnd($path)) {
                return 1;
            }
        }
        return 0;
}


sub isValidStart {
    my ($self, $path) = @_;
        if (substr($path, 0, 1) == $self->{abPathData}->{SEPARATORCHAR} || substr($path, 0, 1) eq ".") {
            return 1;
        } else {
            return 0;
        }
}


sub isValidEnd {
    my ($self, $path) = @_;
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if ($stringValidationUtil->isEmpty($path)) {
            return 0;
        }
        if (substr($path, length($path) - 1, 1) == $self->{abPathData}->{SEPARATORCHAR}) {
            return 1;
        } else {
            return 0;
        }
}


sub adjustStart {
    my ($self, $path) = @_;
        if (!$self->isValidStart($path)) {
            $path = $self->{abPathData}->{SEPARATOR} . $path;
        }
        return $path;
}


sub adjustEnd {
    my ($self, $path) = @_;
        if (!$self->isValidEnd($path)) {
            $path = $path . $self->{abPathData}->{SEPARATOR};
        }
        return $path;
}


sub adjust {
    my ($self, $path) = @_;
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if ($stringValidationUtil->isEmpty($path)) {
            return $self->{abPathData}->{SEPARATOR};
        }
        if (index($path, "\\") >= 0) {
            $path = join($self->{abPathData}->{SEPARATORCHAR}, split(quotemeta("\\"), $path, -1));
        }
        return $path;
}


# throws Exception
sub removeNameFromPath {
    my ($self, $path) = @_;
        my $endIndex = rindex($path, $self->{abPathData}->{SEPARATOR});
        if ($endIndex < 0) {
            $endIndex = rindex($path, $self->{filePathData}->{SEPARATORCHAR});
        }
        if ($endIndex < 0) {
            return 'org::allbinary::logic::io::path::AbPath'->createAbPath();
        }
        if (length($path) == $endIndex + 1) {
            return $self->removeNameFromPath(substr($path, 0, ($endIndex - 1) - (0)));
        } else {
            my $pathWithoutName = substr($path, 0, ($endIndex) - (0));
            return 'org::allbinary::logic::io::path::AbPath'->new($pathWithoutName, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        }
}

use org::allbinary::logic::io::file::FilePathData;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::io::path::AbPath;

1;

