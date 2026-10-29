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

package org::allbinary::game::layer::pickup::IconLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::AllBinaryLayer';

our $NULL_ICON_LAYER = 'org::allbinary::game::layer::pickup::IconLayer'->new('org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0), 0, 0);

sub _init_fields {
    my ($self) = @_;
    $self->{animationInterface} = undef;
}


sub new {
    my ($class, $animationInterface, $width, $height) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, $width, $height), 'org::allbinary::view::ViewPosition'->getInstanceD());
    $self->_init_fields();
        # super(...) made $self above
        $self->{animationInterface} = $animationInterface;
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{animationInterface}->paintXY($graphics, $self->{x}, $self->{y});
}


sub paintThreed {
    my ($self, $graphics) = @_;
        $self->{animationInterface}->paintThreedXYZ($graphics, $self->{x}, $self->{y}, $self->{z});
}


sub getAnimationInterface {
    my ($self) = @_;
        return $self->{animationInterface};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::view::ViewPosition;

1;

