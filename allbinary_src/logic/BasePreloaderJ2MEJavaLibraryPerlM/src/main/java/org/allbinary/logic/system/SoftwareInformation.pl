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

package org::allbinary::logic::system::SoftwareInformation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{shortName} = undef;
    $self->{version} = undef;
}


sub new {
    my ($class, $name, $version, $shortName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{version} = $version;
        $self->{shortName} = 'org::allbinary::logic::string::StringMaker'->new()->append($shortName)->append('org::allbinary::KotlinUtil'->getShortName())->toString();
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getVersion {
    my ($self) = @_;
        return $self->{version};
}


sub toShortString {
    my ($self) = @_;
        return $self->{shortName};
}


sub toString {
    my ($self) = @_;
        my $NAME = "Name: ";
        my $VERSION = "Version: ";
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($NAME);
        $stringBuffer->append($self->getName());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($VERSION);
        $stringBuffer->append($self->getVersion());
        return $stringBuffer->toString();
}

use org::allbinary::KotlinUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

