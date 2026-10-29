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

package org::allbinary::game::layer::hud::basic::ImageHealthGraphic;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::hud::basic::HealthGraphic';


sub _init_fields {
    my ($self) = @_;
    $self->{image} = undef;
}


sub new {
    my ($class, $animationInterface, $healthInterface, $location, $direction) = @_;
    my $self = $class->SUPER::new($animationInterface, $healthInterface, $location, $direction);
    $self->_init_fields();
        # super(...) made $self above
        $self->{image} = [(undef) x ($self->{healthInterface}->getMaxHealth())];
        my $imageCacheFactory = 'org::allbinary::image::ImageCacheFactory'->getInstance();
        for (my $numOfHealth = 0; $numOfHealth <= $self->{max}; $numOfHealth++) {
            $self->{image}->[$numOfHealth] = $imageCacheFactory->get($self, $numOfHealth + 1 * 10, 10);
        }
        for (my $numOfHealth = 0; $numOfHealth <= $self->{max}; $numOfHealth++) {
            for (my $index = 0; $index < $numOfHealth; $index++) {
                $self->{animationInterface}->paint($self->{image}->[$numOfHealth]->getGraphics(), $numOfHealth * 10, 0);
            }
        }
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->drawImage($self->{image}->[$self->{max}], $self->{x}, $self->{y}, $org::allbinary::graphics::Anchor::TOP_LEFT);
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationInterface;
use org::allbinary::game::health::HealthInterface;
use org::allbinary::graphics::Anchor;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::game::layer::hud::basic::HealthGraphic;

1;

