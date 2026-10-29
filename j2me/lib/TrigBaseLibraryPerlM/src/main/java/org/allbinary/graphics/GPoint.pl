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

package org::allbinary::graphics::GPoint;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $POINT_LABEL = "Point: ";

sub _init_fields {
    my ($self) = @_;
    $self->{x} = undef;
    $self->{y} = undef;
    $self->{z} = undef;
}


sub getInstance {
    my ($class, $point) = @_;
        return 'org::allbinary::graphics::GPoint'->new($point->getX(), $point->getY(), $point->getZ());
}


sub new {
    my ($class, $x, $y, $z) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{x} = $x;
        $self->{y} = $y;
        $self->{z} = $z;
    return $self;
}


sub getX {
    my ($self) = @_;
        return $self->{x};
}


sub getY {
    my ($self) = @_;
        return $self->{y};
}


sub getZ {
    my ($self) = @_;
        return $self->{z};
}


sub getRawX {
    my ($self) = @_;
        return $self->{x};
}


sub getRawY {
    my ($self) = @_;
        return $self->{y};
}


sub getRawZ {
    my ($self) = @_;
        return $self->{z};
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::graphics::GPoint'->toStringStatic($self->getX(), $self->getY(), $self->getZ());
}


sub toStringStatic {
    my ($class, $x, $y, $z) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $positionStrings = 'org::allbinary::math::PositionStrings'->getInstance();
        $stringBuffer->append($org::allbinary::graphics::GPoint::POINT_LABEL);
        $stringBuffer->append($positionStrings->{X_LABEL});
        $stringBuffer->appendint($x);
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($positionStrings->{Y_LABEL});
        $stringBuffer->appendint($y);
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($positionStrings->{Z_LABEL});
        $stringBuffer->appendint($z);
        return $stringBuffer->toString();
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonSeps;

1;

