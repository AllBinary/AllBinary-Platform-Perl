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
package org::allbinary::logic::io::file::path::AbPathUtilOld;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::file::path::AbPathUtilOld'->new() };
our $MIN = 4;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abPathData} = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
    $self->{filePathData} = 'org::allbinary::logic::io::file::FilePathData'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::path::AbPathUtilOld::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getExtension_j1_1 {
    my ($self, $abFilePath) = @_;
        return $self->getExtension($abFilePath->toString());
}


# throws Exception
sub getExtension_j1_2 {
    my ($self, $abPath) = @_;
        return $self->getExtension($abPath->toString());
}


# throws Exception
sub getExtension_j1_3 {
    my ($self, $filePath) = @_;
        if (length($filePath) < $org::allbinary::logic::io::file::path::AbPathUtilOld::MIN) {
            die ("Could not be a file path since its less that 4 characters");
        }
        my $beginIndex = length($filePath) - $org::allbinary::logic::io::file::path::AbPathUtilOld::MIN;
        my $extension = substr($filePath, $beginIndex + 1);
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("FileExtension: " . $extension, $self, "getExtension()");
        }
        return $extension;
}

sub getExtension {
    my ($invocant, @arguments) = @_;
    return $invocant->getExtension_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getExtension takes " . scalar(@arguments) . " arguments";
}

sub getExtension_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->getExtension_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->getExtension_j1_2(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->getExtension_j1_3(@arguments);
}


# throws Exception
sub getWithoutExtension_j1_1 {
    my ($self, $abFilePath) = @_;
        return $self->getWithoutExtension($abFilePath->toString());
}


# throws Exception
sub getWithoutExtension_j1_2 {
    my ($self, $abPath) = @_;
        return $self->getWithoutExtension($abPath->toString());
}


# throws Exception
sub getWithoutExtension_j1_3 {
    my ($self, $filePath) = @_;
        if (length($filePath) < $org::allbinary::logic::io::file::path::AbPathUtilOld::MIN) {
            die ("Could not be a file path since its less that 4 characters");
        }
        my $endIndex = length($filePath) - $org::allbinary::logic::io::file::path::AbPathUtilOld::MIN;
        my $pathWithoutExtension = substr($filePath, 0, ($endIndex) - (0));
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("FileWithoutExtension: " . $pathWithoutExtension, $self, "getWithoutExtension()");
        }
        return $pathWithoutExtension;
}

sub getWithoutExtension {
    my ($invocant, @arguments) = @_;
    return $invocant->getWithoutExtension_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getWithoutExtension takes " . scalar(@arguments) . " arguments";
}

sub getWithoutExtension_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->getWithoutExtension_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->getWithoutExtension_j1_2(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->getWithoutExtension_j1_3(@arguments);
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
        if (substr($path, 0, 1) == $self->{abPathData}->{SEPARATORCHAR}) {
            return 1;
        } else {
            return 0;
        }
}


sub isValidEnd {
    my ($self, $path) = @_;
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($path)) {
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
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($path)) {
            return $self->{abPathData}->{SEPARATOR};
        }
        if (index($path, "\\") >= 0) {
            $path = join($self->{abPathData}->{SEPARATORCHAR}, split(quotemeta("\\"), $path, -1));
        }
        return $path;
}


sub getNameFromPath {
    my ($self, $categoryPath) = @_;
        my $endIndex = rindex($categoryPath, $self->{abPathData}->{SEPARATOR});
        if ($endIndex < 0) {
            $endIndex = rindex($categoryPath, $self->{filePathData}->{SEPARATORCHAR});
        }
        if ($endIndex < 0) {
            return $categoryPath;
        }
        if (length($categoryPath) == $endIndex + 1) {
            my $categoryName = substr($categoryPath, 0, ($endIndex) - (0));
            return $self->getNameFromPath($categoryName);
        } else {
            my $categoryName = substr($categoryPath, $endIndex + 1);
            return $categoryName;
        }
}


# throws Exception
sub removeNameFromPath {
    my ($self, $categoryPath) = @_;
        my $endIndex = rindex($categoryPath, $self->{abPathData}->{SEPARATOR});
        if ($endIndex < 0) {
            $endIndex = rindex($categoryPath, $self->{filePathData}->{SEPARATORCHAR});
        }
        if ($endIndex < 0) {
            return 'org::allbinary::logic::io::path::AbPath'->createAbPath();
        }
        if (length($categoryPath) == $endIndex + 1) {
            return $self->removeNameFromPath(substr($categoryPath, 0, ($endIndex - 1) - (0)));
        } else {
            my $categoryName = substr($categoryPath, 0, ($endIndex) - (0));
            return 'org::allbinary::logic::io::path::AbPath'->new($categoryName, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        }
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::io::file::FilePathData ();
use org::allbinary::logic::io::path::AbFilePath ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::logic::io::path::AbPathData ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::logic::string::StringValidationUtil ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();

1;

