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

package org::allbinary::logic::io::path::AbPath;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NETWORK_SEP = ":/";

sub _init_fields {
    my ($self) = @_;
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{abPathData} = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
    $self->{abPathUtil} = 'org::allbinary::logic::io::path::PathUtil'->getInstance();
    $self->{EMPTY_STRING} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{schema} = $self->{EMPTY_STRING};
    $self->{path} = $self->{EMPTY_STRING};
    $self->{nameP} = $self->{EMPTY_STRING};
    $self->{hasSchemaP} = 0;
    $self->{numberOfSeps} = 0;
}


sub createAbPath {
    my ($class) = @_;
        try {
            my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            return 'org::allbinary::logic::io::path::AbPath'->new($EMPTY_STRING, $EMPTY_STRING);
        } catch ($ex) {
            die ("RuntimeException");
        }
}


sub new {
    my ($class, $aPath, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isEmpty($aPath)) {
            $self->{schema} = $self->getSchema($aPath);
            $self->{nameP} = $name;
            $self->{path} = $self->{abPathUtil}->adjustEnd($self->{abPathUtil}->adjust($self->getPathFromPath($aPath)));
        } else {
            $self->init();
            if (!$stringValidationUtil->isEmpty($name)) {
                $self->{nameP} = $name;
            }
        }
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{schema} = $self->{EMPTY_STRING};
        $self->setPath($self->{abPathData}->{SEPARATOR});
        $self->{nameP} = $self->{EMPTY_STRING};
}


sub getSchema {
    my ($self, $aPath) = @_;
        my $beginIndex = index($aPath, $self->{commonSeps}->{COLON});
        if ($beginIndex >= 0) {
            $self->{hasSchemaP} = 1;
            return substr($aPath, 0, ($beginIndex) - (0));
        }
        $self->{hasSchemaP} = 0;
        return $self->{EMPTY_STRING};
}


sub hasSchema {
    my ($self) = @_;
        return $self->{hasSchemaP};
}


# throws Exception
sub getPathFromPath {
    my ($self, $aPath) = @_;
        my $filePathData = 'org::allbinary::logic::io::file::FilePathData'->getInstance();
        my $tempPath = $aPath;
        if (!$self->hasSchema()) {
            $tempPath = $self->{abPathUtil}->adjustStart($tempPath);
        } else {
            my $beginIndex = index($tempPath, $self->{commonSeps}->{COLON});
            if ($beginIndex >= 0) {
                $beginIndex++;
                while (substr($tempPath, $beginIndex, 1) == $self->{abPathData}->{SEPARATORCHAR} || substr($tempPath, $beginIndex, 1) == $filePathData->{SEPARATORCHAR}) {
                    $beginIndex++;
                    $self->{numberOfSeps}++;
                    if ($self->{numberOfSeps} > 2) {
                        die ("Should Not Have More Than Two Seps");
                    }
                }
                $tempPath = substr($tempPath, $beginIndex, (length($tempPath)) - ($beginIndex));
            }
        }
        return $tempPath;
}


sub setName {
    my ($self, $name) = @_;
        $self->{nameP} = $name;
}


sub getName {
    my ($self) = @_;
        return $self->{nameP};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if ($self->hasSchema()) {
            $stringBuffer->append($self->{schema});
            $stringBuffer->append($org::allbinary::logic::io::path::AbPath::NETWORK_SEP);
        }
        $stringBuffer->append($self->getPath());
        $stringBuffer->append($self->{nameP});
        return $stringBuffer->toString();
}


sub toFileSystemString {
    my ($self) = @_;
        if ($self->hasSchema()) {
            my $filePathData = 'org::allbinary::logic::io::file::FilePathData'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{schema});
            $stringBuffer->append($self->{commonSeps}->{COLON});
            $stringBuffer->append($filePathData->{PATH_START});
            $stringBuffer->append('org::allbinary::logic::io::file::FilePathUtil'->adjust($self->getPath()));
            $stringBuffer->append($self->{nameP});
            return $stringBuffer->toString();
        } else {
            return 'org::allbinary::logic::io::file::FilePathUtil'->adjust($self->getPath()) . $self->{nameP};
        }
}


sub getPath {
    my ($self) = @_;
        return $self->{path};
}


sub setPath {
    my ($self, $path) = @_;
        $self->{path} = $path;
}

use org::allbinary::logic::io::file::FilePathData;
use org::allbinary::logic::io::file::FilePathUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::io::path::PathUtil;

1;

