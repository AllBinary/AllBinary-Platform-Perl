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

package org::allbinary::game::layer::hud::event::GameNotificationEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{string} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{seconds} = undef;
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK};
    $self->{removeable} = undef;
}


sub new {
    my ($class, $anyType, $string, $seconds, $basicColor, $permanent) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
        $self->setString($string);
        $self->{seconds} = $seconds;
        $self->setBasicColorP($basicColor);
        $self->{removeable} = $permanent;
    return $self;
}


sub getString {
    my ($self) = @_;
        return $self->{string};
}


sub getSeconds {
    my ($self) = @_;
        return $self->{seconds};
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}


sub getPermanent {
    my ($self) = @_;
        return $self->{removeable};
}


sub setString {
    my ($self, $string) = @_;
        $self->{string} = $string;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
}

use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

