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

package org::allbinary::media::image::comparison::color::ColorDelta;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::CacheableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{rgb1} = 0;
    $self->{rgb2} = 0;
    $self->{key} = undef;
}


sub new {
    my ($class, $rgb1, $rgb2) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setRgb1($rgb1);
        $self->setRgb2($rgb2);
        $self->{key} = 'org::allbinary::media::image::comparison::color::ColorDelta'->getKey($rgb1, $rgb2);
    return $self;
}


sub getKey {
    my ($self) = @_;
        return $self->{key};
}


# Java overloaded method: Perl keeps the last definition
sub getKey {
    my ($class, $rgb1, $rgb2) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append(("" . ($rgb1)))->append('org::allbinary::string::CommonSeps'->getInstance()->{UNDERSCORE})->append(("" . ($rgb2)))->toString();
}


sub getRgb1 {
    my ($self) = @_;
        return $self->{rgb1};
}


sub setRgb1 {
    my ($self, $rgb1) = @_;
        $self->{rgb1} = $rgb1;
}


sub getRgb2 {
    my ($self) = @_;
        return $self->{rgb2};
}


sub setRgb2 {
    my ($self, $rgb2) = @_;
        $self->{rgb2} = $rgb2;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append("ColorDelta: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->getKey()))->append(" RGB1: ")->appendint($self->getRgb1())->append(" RGB2: ")->appendint($self->getRgb2())->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::cache::CacheableInterface;
use org::allbinary::string::CommonSeps;

1;

