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

package org::allbinary::graphics::color::BasicColor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{value} = undef;
    $self->{redComponent} = undef;
    $self->{greenComponent} = undef;
    $self->{blueComponent} = undef;
    $self->{alphaComponent} = undef;
    $self->{red} = undef;
    $self->{green} = undef;
    $self->{blue} = undef;
    $self->{alpha} = undef;
}


sub new {
    my ($class, $alphaValue, $value, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        my $tempValue = 0;
        my $basicColorUtil = 'org::allbinary::graphics::color::BasicColorUtil'->getInstance();
        if ($basicColorUtil->{isAlpha}) {
            if ($basicColorUtil->{ffOpaque}) {
                $tempValue = $alphaValue | $value;
            } else {
                $tempValue = 0x00000000 | $value;
            }
        } else {
            $tempValue = $value;
        }
        my $alphaInt = ((POSIX::floor(($tempValue) / (2 ** (24)))) & 255);
        $self->{alpha} = ((int($alphaInt) + 32768) % 65536 - 32768);
        $self->{alphaComponent} = ($alphaInt) / 255.0;
        my $redInt = ((POSIX::floor(($tempValue) / (2 ** (16)))) & 255);
        $self->{red} = ((int($redInt) + 32768) % 65536 - 32768);
        $self->{redComponent} = ($redInt) / 255.0;
        my $greenInt = ((POSIX::floor(($tempValue) / (2 ** (8)))) & 255);
        $self->{green} = ((int($greenInt) + 32768) % 65536 - 32768);
        $self->{greenComponent} = ($greenInt) / 255.0;
        my $blueInt = (($tempValue) & 255);
        $self->{blue} = ((int($blueInt) + 32768) % 65536 - 32768);
        $self->{blueComponent} = ($blueInt) / 255.0;
        $self->{value} = $tempValue;
    return $self;
}


sub intValue {
    my ($self) = @_;
        return $self->{value};
}


sub toInt {
    my ($self) = @_;
        return $self->{value};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("BasicColor: ");
        $stringBuffer->append("Alpha: ");
        $stringBuffer->appendshort($self->{alpha});
        $stringBuffer->append(" Red: ");
        $stringBuffer->appendshort($self->{red});
        $stringBuffer->append(" Green: ");
        $stringBuffer->appendshort($self->{green});
        $stringBuffer->append(" Blue: ");
        $stringBuffer->appendshort($self->{blue});
        $stringBuffer->append(" Value: ");
        $stringBuffer->appendint($self->{value});
        return $stringBuffer->toString();
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getRedComponent {
    my ($self) = @_;
        return $self->{redComponent};
}


sub getGreenComponent {
    my ($self) = @_;
        return $self->{greenComponent};
}


sub getBlueComponent {
    my ($self) = @_;
        return $self->{blueComponent};
}


sub getAlphaComponent {
    my ($self) = @_;
        return $self->{alphaComponent};
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::string::StringMaker;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;
use org::allbinary::graphics::color::BasicColorUtil;

1;

