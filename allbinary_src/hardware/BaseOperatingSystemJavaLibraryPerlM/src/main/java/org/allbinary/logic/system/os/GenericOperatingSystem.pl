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

package org::allbinary::logic::system::os::GenericOperatingSystem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::os::OperatingSystemInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{osName} = undef;
    $self->{osArch} = undef;
    $self->{osVersion} = undef;
    $self->{characterSet} = 'org::allbinary::logic::java::character::CharacterSet'->new();
    $self->{scalable} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $systemProperties = 'org::allbinary::logic::system::os::SystemProperties'->getInstance();
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        if ($stringValidationUtil->isEmpty($systemProperties->getName())) {
            $self->{osName} = $EMPTY_STRING;
        } else {
            $self->{osName} = $systemProperties->getName();
        }
        if ($stringValidationUtil->isEmpty($systemProperties->getArch())) {
            $self->{osArch} = $EMPTY_STRING;
        } else {
            $self->{osArch} = $systemProperties->getArch();
        }
        if ($stringValidationUtil->isEmpty($systemProperties->getVersion())) {
            $self->{osVersion} = $EMPTY_STRING;
        } else {
            $self->{osVersion} = $systemProperties->getVersion();
        }
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{osName};
}


sub getVersion {
    my ($self) = @_;
        return $self->{osVersion};
}


sub getArch {
    my ($self) = @_;
        return $self->{osArch};
}


sub getCharacterSet {
    my ($self) = @_;
        return $self->{characterSet};
}


sub isOverScan {
    my ($self) = @_;
        return 0;
}


sub getOverScanXPercent {
    my ($self) = @_;
        return 100;
}


sub getOverScanYPercent {
    my ($self) = @_;
        return 100;
}


sub isScalable {
    my ($self) = @_;
        return $self->{scalable};
}


sub isAutoHide {
    my ($self) = @_;
        return 0;
}


sub toString {
    my ($self) = @_;
        my $NEW_LINE = 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE};
        my $osBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $osBuffer->append("Operating System Info: \n");
        $osBuffer->append($self->getName());
        $osBuffer->append($NEW_LINE);
        $osBuffer->append($self->getArch());
        $osBuffer->append($NEW_LINE);
        $osBuffer->append($self->getVersion());
        $osBuffer->append($NEW_LINE);
        $osBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->getCharacterSet()));
        $osBuffer->append($NEW_LINE);
        return $osBuffer->toString();
}

use org::allbinary::logic::java::character::CharacterSet;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::system::os::OperatingSystemInterface;
use org::allbinary::logic::system::os::SystemProperties;

1;

