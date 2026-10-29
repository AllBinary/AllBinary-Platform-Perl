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

package org::allbinary::logic::io::path::AbPathData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::path::AbPathData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EXTENSION_SEP} = 'org::allbinary::string::CommonSeps'->getInstance()->{PERIOD};
    $self->{SEPARATORCHAR} = "/";
    $self->{SEPARATOR} = 'org::allbinary::string::CommonSeps'->getInstance()->{FORWARD_SLASH};
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::path::AbPathData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getExtensionIndex {
    my ($self, $filePath) = @_;
        my $indexOfFileExtensionDelmiter = rindex($filePath, $self->{EXTENSION_SEP});
        my $indexOfLatDelimiter = rindex($filePath, $self->{SEPARATORCHAR});
        if ($indexOfFileExtensionDelmiter < 0) {
            return -1;
        }
        if ($indexOfFileExtensionDelmiter < $indexOfLatDelimiter) {
            return -1;
        }
        return $indexOfFileExtensionDelmiter;
}


sub getExtensionWithDot {
    my ($self, $filePath) = @_;
        my $indexOfFileExtensionDelmiter = $self->getExtensionIndex($filePath);
        my $extension = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        if ($indexOfFileExtensionDelmiter >= 0) {
            $extension = substr($filePath, $indexOfFileExtensionDelmiter);
        }
        return $extension;
}


sub getExtension {
    my ($self, $filePath) = @_;
        my $indexOfFileExtensionDelmiter = $self->getExtensionIndex($filePath);
        my $extension = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        if ($indexOfFileExtensionDelmiter >= 0) {
            $extension = substr($filePath, $indexOfFileExtensionDelmiter + 1);
        }
        return $extension;
}


sub getNameFromPath {
    my ($self, $path) = @_;
        my $endIndex = rindex($path, $self->{SEPARATORCHAR});
        if ($endIndex < 0) {
            $endIndex = rindex($path, 'org::allbinary::logic::io::file::FilePathData'->getInstance()->{SEPARATORCHAR});
        }
        if ($endIndex < 0) {
            return $path;
        }
        if (length($path) == $endIndex + 1) {
            my $categoryName = substr($path, 0, ($endIndex) - (0));
            return $self->getNameFromPath($categoryName);
        } else {
            my $categoryName = substr($path, $endIndex + 1);
            return $categoryName;
        }
}


sub removeNameFromPath {
    my ($self, $path) = @_;
        my $endIndex = rindex($path, $self->{SEPARATORCHAR});
        if ($endIndex < 0) {
            $endIndex = rindex($path, 'org::allbinary::logic::io::file::FilePathData'->getInstance()->{SEPARATORCHAR});
        }
        if ($endIndex < 0) {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
        if (length($path) == $endIndex + 1) {
            return $self->removeNameFromPath(substr($path, 0, ($endIndex - 1) - (0)));
        } else {
            my $pathWithoutName = substr($path, 0, ($endIndex) - (0));
            return $pathWithoutName;
        }
}

use org::allbinary::logic::io::file::FilePathData;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;

1;

