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

package org::allbinary::game::configuration::GameConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $MIN_VALUE = (-2147483648);

sub _init_fields {
    my ($self) = @_;
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{defaultValue} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0);
    $self->{value} = $org::allbinary::game::configuration::GameConfiguration::MIN_VALUE;
    $self->{minValue} = $self->{defaultValue};
    $self->{maxValue} = $self->{defaultValue};
    $self->{modifiable} = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE};
}


sub new {
    my ($class, $name, $defaultValue, $minValue, $maxValue) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $self->setDefaultValue($defaultValue);
        $self->{value} = $self->getDefaultValue();
        $self->setMinValue($minValue);
        $self->setMaxValue($maxValue);
        'org::allbinary::game::configuration::GameConfigurationSingleton'->getInstance()->getHashtable()->put($self->getName(), $self);
    return $self;
}


# throws Exception
sub setValue {
    my ($self, $value) = @_;
        if ($self->{value} != $value) {
            my $oldValue = $self->{value};
            $self->{value} = $value;
            'org::allbinary::game::configuration::event::GameFeatureEventHandler'->getInstance()->fireEvent('org::allbinary::game::configuration::event::GameFeatureEvent'->new($self, 'org::allbinary::logic::string::StringMaker'->new()->append($self->{name})->append(" value: from: ")->appendint(int(int($oldValue)))->append(" to ")->appendint(int(int($self->{value})))->toString()));
        }
}


sub getValue {
    my ($self) = @_;
        return $self->{value};
}


sub setMaxValue {
    my ($self, $maxValue) = @_;
        $self->{maxValue} = $maxValue;
}


sub getMaxValue {
    my ($self) = @_;
        return $self->{maxValue};
}


sub setMinValue {
    my ($self, $minValue) = @_;
        $self->{minValue} = $minValue;
}


sub getMinValue {
    my ($self) = @_;
        return $self->{minValue};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setDefaultValue {
    my ($self, $defaultValue) = @_;
        $self->{defaultValue} = $defaultValue;
}


sub getDefaultValue {
    my ($self) = @_;
        return $self->{defaultValue};
}


# throws Exception
sub setDefault {
    my ($self) = @_;
        $self->setValue($self->getDefaultValue());
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Name: ");
        $stringBuffer->append($self->{name});
        $stringBuffer->append(" Min: ");
        $stringBuffer->appendint(int(int($self->getMinValue())));
        $stringBuffer->append(" Max: ");
        $stringBuffer->appendint(int(int($self->getMaxValue())));
        $stringBuffer->append(" Value: ");
        $stringBuffer->appendint(int(int($self->getValue())));
        $stringBuffer->append(" Default: ");
        $stringBuffer->appendint(int(int($self->getDefaultValue())));
        $stringBuffer->append(" Modifiable: ");
        $stringBuffer->appendboolean($self->isModifiable());
        return $stringBuffer->toString();
}


sub setModifiable {
    my ($self, $modifiable) = @_;
        $self->{modifiable} = $modifiable;
}


sub isModifiable {
    my ($self) = @_;
        return $self->{modifiable};
}

use org::allbinary::game::configuration::event::GameFeatureEvent;
use org::allbinary::game::configuration::event::GameFeatureEventHandler;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::configuration::GameConfigurationSingleton;

1;

