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

package org::allbinary::graphics::color::BasicColorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::color::BasicColorFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_COLOR} = $self->createInstanceARGB(255, 255, 255, 255, "null color");
    $self->{TAN} = $self->createInstance(0xE9D8B5);
    $self->{SKIN_PINK} = $self->createInstance(0xFDCECE);
    $self->{RED} = $self->createInstanceAN('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, 0xFF0000, "red");
    $self->{LIGHT_RED} = $self->createInstanceAN('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, 0xFFA0A0, "light red");
    $self->{DARK_GREEN} = $self->createInstance(0x00FF00);
    $self->{GREEN} = $self->createInstanceAN('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, 0x00DD00, "green");
    $self->{LIGHT_GREEN} = $self->createInstance(0x007700);
    $self->{PURPLE} = $self->createInstanceAN('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, 0x400040, "purple");
    $self->{BLUE} = $self->createInstanceAN('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, 0x0000FF, "blue");
    $self->{LIGHT_BLUE} = $self->createInstance(0x00aaff);
    $self->{VERY_LIGHT_BLUE} = $self->createInstance(0x000033);
    $self->{PUCE} = $self->createInstance(0xFF00AA);
    $self->{AQUA} = $self->createInstance(0x00FFFF);
    $self->{YELLOW} = $self->createInstanceAN('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, 0xFFFF00, "yellow");
    $self->{PINK} = $self->createInstance(0xFF00FF);
    $self->{BLACK} = $self->createInstanceAN('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, 0x000000, "black");
    $self->{GREY} = $self->createInstanceAN('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, 0xAAAAAA, "grey");
    $self->{LIGHT_GREY} = $self->createInstance(0xC0C0C0);
    $self->{DARK_GREY} = $self->createInstance(0x404040);
    $self->{ORANGE} = $self->createInstance(0xe07718);
    $self->{BROWN} = $self->createInstance(0x956B00);
    $self->{WHITE} = $self->createInstance(0xFFFFFF);
    $self->{TRANSPARENT_COLOR} = $self->createInstanceAN(0x00000000, 0x000000, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    $self->{TRANSPARENT_GREY} = $self->createInstanceAN(0x52000000, 0xECECEC, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    $self->{TRANSPARENT_BLACK} = $self->createInstanceAN(0x52000000, 0x000000, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    $self->{TRANSPARENT_RED} = $self->createInstanceAN(0x52000000, 0xFF0000, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    $self->{CLEAR_COLOR} = $self->{BLACK};
    $self->{BORDER_COLOR} = $self->{WHITE};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::color::BasicColorFactory::instance;
}


sub createInstance {
    my ($self, $value) = @_;
        return 'org::allbinary::graphics::color::BasicColor'->new('org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ALPHA}, $value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


sub createInstanceA {
    my ($self, $alphaValue, $value) = @_;
        return 'org::allbinary::graphics::color::BasicColor'->new($alphaValue, $value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


sub createInstanceAN {
    my ($self, $alphaValue, $value, $name) = @_;
        return 'org::allbinary::graphics::color::BasicColor'->new($alphaValue, $value, $name);
}


sub createInstanceARGB {
    my ($self, $alphaValue, $r, $g, $b, $name) = @_;
        my $ALPHA_MASK = 0xFF000000;
        return 'org::allbinary::graphics::color::BasicColor'->new($alphaValue, (($alphaValue << 24) & $ALPHA_MASK) + (($r << 16) & 0x00FF0000) + (($g << 8) & 0x0000FF00) + ($b & 0x000000FF), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::string::StringUtil;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsProperty;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorUtil;

1;

