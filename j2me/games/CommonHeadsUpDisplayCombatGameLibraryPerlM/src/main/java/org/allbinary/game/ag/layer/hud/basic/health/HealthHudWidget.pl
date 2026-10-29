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

package org::allbinary::game::ag::layer::hud::basic::health::HealthHudWidget;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud','org::allbinary::graphics::paint::PaintableInterface','org::allbinary::game::health::HealthListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{healthScale} = undef;
    $self->{animationInterface} = undef;
    $self->{healthInterface} = undef;
    $self->{max} = 0;
    $self->{xArray} = undef;
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
    $self->{timeDelayHelper} = $org::allbinary::time::NoTimeDelayHelper::SINGLETON;
    $self->{slowBeatTimeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(1280);
    $self->{mediumBeatTimeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(640);
    $self->{fastBeatTimeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(320);
}


sub new {
    my ($class, $animationInterface, $healthInterface, $location, $direction) = @_;
    my $self = $class->SUPER::new($location, $direction, 2, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
    $self->_init_fields();
        # super(...) made $self above
        $self->{animationInterface} = $animationInterface;
        $self->{healthInterface} = $healthInterface;
        $self->{healthInterface}->addListener($self);
        $self->{healthScale} = ($self->{healthInterface}->getMaxHealth() / 6) + 1;
        $self->onHealthChange();
        $self->{updateMaxWidth} = $healthInterface->getMaxHealth() * 16;
        $self->{updateMaxHeight} = 16;
        $self->{xArray} = [(0) x (30)];
        $self->update();
    return $self;
}


sub update {
    my ($self) = @_;
        if (defined($self->{xArray})) {
            for (my $index = 0; $index < scalar(@{$self->{xArray}}); $index++) {
                $self->{xArray}->[$index] = $self->getX() + ($index * 16);
            }
        }
}


sub setX {
    my ($self, $x) = @_;
        $self->SUPER::setX($x);
        $self->update();
}


sub onHealthChange {
    my ($self) = @_;
        $self->{max} = ($self->{healthInterface}->getHealth() / $self->{healthScale});
        $self->{timeDelayHelper} = $org::allbinary::time::NoTimeDelayHelper::SINGLETON;
        if ($self->{max} <= 1 && $self->{healthInterface}->isAlive()) {
            $self->{max} = 1;
            if ($self->{healthScale} - $self->{healthInterface}->getHealth() > int(($self->{healthScale} * 2) / 3)) {
                $self->{timeDelayHelper} = $self->{slowBeatTimeDelayHelper};
            } elsif ($self->{healthScale} - $self->{healthInterface}->getHealth() > int($self->{healthScale} / 3)) {
                $self->{timeDelayHelper} = $self->{mediumBeatTimeDelayHelper};
            } else {
                $self->{timeDelayHelper} = $self->{fastBeatTimeDelayHelper};
            }
        }
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        for (my $index = 0; $index < $self->{max}; $index++) {
            if ($self->{timeDelayHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
                $self->{animationInterface}->paintXY($graphics, $self->{xArray}->[$index], $self->getY());
            }
        }
}


sub paintThreed {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::game::graphics::hud::BasicHud;
use org::allbinary::game::health::Health;
use org::allbinary::game::health::HealthListenerInterface;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::NoTimeDelayHelper;
use org::allbinary::time::TimeDelayHelper;

1;

