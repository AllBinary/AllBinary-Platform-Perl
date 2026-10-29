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

package org::allbinary::business::category::properties::CategoryPropertiesFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{categoryPropertiesInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of CategoryPropertiesFactory takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{categoryPropertiesInterface} = 'org::allbinary::business::category::properties::CategoryProperties'->new($name);
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{categoryPropertiesInterface} = 'org::allbinary::business::category::properties::CategoryProperties'->new($node);
    return $self;
}


sub _new1 {
    my ($class, $categoryPropertiesHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{categoryPropertiesInterface} = 'org::allbinary::business::category::properties::CategoryProperties'->new($categoryPropertiesHashMap);
    return $self;
}


sub getInstance {
    my ($self) = @_;
        try {
            return $self->{categoryPropertiesInterface};
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::business::category::properties::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::properties::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

use java::util::HashMap;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Node;
use org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface;
use org::allbinary::business::category::properties::CategoryProperties;

1;

