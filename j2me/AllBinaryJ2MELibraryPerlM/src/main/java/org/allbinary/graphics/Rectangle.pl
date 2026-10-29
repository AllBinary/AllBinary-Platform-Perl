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

package org::allbinary::graphics::Rectangle;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{point} = undef;
    $self->{width} = undef;
    $self->{height} = undef;
}


sub new {
    my ($class, $point, $width, $height) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{point} = $point;
        $self->{width} = $width;
        $self->{height} = $height;
    return $self;
}


sub getPoint {
    my ($self) = @_;
        return $self->{point};
}


sub setPoint {
    my ($self, $point) = @_;
        $self->{point} = $point;
}


sub getMaxX {
    my ($self) = @_;
        return $self->{point}->getX() + $self->{width};
}


sub getMaxY {
    my ($self) = @_;
        return $self->{point}->getY() + $self->{height};
}


sub getWidth {
    my ($self) = @_;
        return $self->{width};
}


sub setWidth {
    my ($self, $width) = @_;
        $self->{width} = $width;
}


sub getHeight {
    my ($self) = @_;
        return $self->{height};
}


sub setHeight {
    my ($self, $height) = @_;
        $self->{height} = $height;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->getPoint()->toString());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{WIDTH_LABEL});
        $stringBuffer->appendint($self->getWidth());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{HEIGHT_LABEL});
        $stringBuffer->appendint($self->getHeight());
        $stringBuffer->append(" MaxX: ");
        $stringBuffer->appendint($self->getMaxX());
        $stringBuffer->append(" MaxY: ");
        $stringBuffer->appendint($self->getMaxY());
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;

1;

