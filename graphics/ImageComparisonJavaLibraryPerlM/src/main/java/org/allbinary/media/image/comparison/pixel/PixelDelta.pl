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

package org::allbinary::media::image::comparison::pixel::PixelDelta;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::CacheableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{point} = undef;
    $self->{colorDelta} = undef;
    $self->{key} = undef;
}


sub new {
    my ($class, $point, $colorDelta) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setPoint($point);
        $self->setColorDelta($colorDelta);
        $self->{key} = 'org::allbinary::media::image::comparison::pixel::PixelDelta'->getKey($self->getPoint(), $self->getColorDelta());
    return $self;
}


sub getKey {
    my ($self) = @_;
        return $self->{key};
}


# Java overloaded method: Perl keeps the last definition
sub getKey {
    my ($class, $point, $colorDelta) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($point)))->append('org::allbinary::string::CommonSeps'->getInstance()->{UNDERSCORE})->append($colorDelta->getKey()->toString())->toString();
}


sub getPoint {
    my ($self) = @_;
        return $self->{point};
}


sub setPoint {
    my ($self, $point) = @_;
        $self->{point} = $point;
}


sub getColorDelta {
    my ($self) = @_;
        return $self->{colorDelta};
}


sub setColorDelta {
    my ($self, $colorDelta) = @_;
        $self->{colorDelta} = $colorDelta;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append("PixelDelta: Point: ")->append($self->{point}->toString())->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{colorDelta}->toString())->toString();
}

use org::allbinary::graphics::GPoint;
use org::allbinary::TsUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::cache::CacheableInterface;
use org::allbinary::media::image::comparison::color::ColorDelta;
use org::allbinary::string::CommonSeps;

1;

