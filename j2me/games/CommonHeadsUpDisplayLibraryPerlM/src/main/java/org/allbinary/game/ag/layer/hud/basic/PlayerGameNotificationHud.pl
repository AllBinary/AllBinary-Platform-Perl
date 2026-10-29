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

package org::allbinary::game::ag::layer::hud::basic::PlayerGameNotificationHud;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
    $self->{EMPTY_STRING} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{displayInfo} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{circularIndexUtil} = undef;
    $self->{gameNotification} = 'org::allbinary::game::ag::layer::hud::basic::notification::GameNotification'->new();
    $self->{permanentGameNotification} = 'org::allbinary::game::ag::layer::hud::basic::notification::GameNotification'->new();
    $self->{setAndRemoveProcessor} = 'org::allbinary::game::ag::layer::hud::basic::SetAndRemoveProcessor'->new($self);
    $self->{nextUnremoveableProcessor} = 'org::allbinary::game::ag::layer::hud::basic::NextUnremoveableProcessor'->new($self);
    $self->{processor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{PERMANENT_GAME_NOTIFICATION} = "Permanent Game Notification: ";
    $self->{lastString} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{string} = $self->{EMPTY_STRING};
    $self->{point} = $org::allbinary::graphics::CustomGPoint::NULL_CUSTOM_POINT;
    $self->{width} = 0;
}


sub new {
    my ($class, $location, $direction, $bufferZone, $basicColor) = @_;
    my $self = $class->SUPER::new($location, $direction, $bufferZone, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(0);
        my $gameNotificationEventHandler = 'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance();
        $gameNotificationEventHandler->removeAllListeners();
        $gameNotificationEventHandler->addListenerInterface($self);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        try {
            $self->SUPER::updateMeasurement($graphics);
            my $font = $graphics->getFont();
            $self->{width} = $font->stringWidth($self->{string});
            $self->{processor}->process();
            $self->{processor} = 'org::allbinary::canvas::Processor'->getInstance();
        } catch ($e) {
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{UPDATE}, $e);
        }
}


sub getPoint {
    my ($self, $x, $y) = @_;
        $self->{point} = 'org::allbinary::graphics::CustomGPoint'->getInstance3(0, 0);
        $self->{point}->setX($x);
        $self->{point}->setY($y);
        return $self->{point};
}


sub add {
    my ($self, $string, $seconds, $basicColor, $permanent) = @_;
        if ($permanent) {
            if ($self->{lastString} ne $string) {
                $self->{lastString} = $string;
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{PERMANENT_GAME_NOTIFICATION})->append($string)->toString(), $self, $self->{commonStrings}->{ADD});
            }
            $self->{permanentGameNotification}->add($string, $seconds, $basicColor);
            $self->{circularIndexUtil}->setSize($self->{permanentGameNotification}->getSize());
        } else {
            $self->{gameNotification}->add($string, $seconds, $basicColor);
        }
}


# throws Exception
sub processTick {
    my ($self) = @_;
        if ($self->{timeDelayHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
            my $gameAdState = 'org::allbinary::business::advertisement::GameAdStateFactory'->getInstance()->getCurrentInstance();
            if ($gameAdState->isShowingAtLocation($self->getLocation())) {
                $self->{offsetY} = -54;
            } else {
                $self->{offsetY} = 0;
            }
            if ($self->{gameNotification}->getSize() > 0) {
                $self->setAndRemove();
            } elsif ($self->{permanentGameNotification}->getSize() > 0) {
                $self->setNextUnremoveable();
            } else {
                $self->{string} = $self->{EMPTY_STRING};
            }
        }
}


# throws Exception
sub setAndRemove {
    my ($self) = @_;
        $self->{string} = $self->{gameNotification}->{stringList}->removeAt(0);
        $self->{processor} = $self->{setAndRemoveProcessor};
}


# throws Exception
sub setAndRemoveProcess {
    my ($self) = @_;
        $self->setX(POSIX::floor((($self->{displayInfo}->getLastWidth() - $self->{width})) / (2 ** (1))));
        $self->{point}->setX($self->getX());
        $self->{point}->setY($self->getY());
        my $time = $self->{gameNotification}->{timeList}->removeAt(0);
        my $iTime = int($time) * 1000;
        if ($iTime == 0) {
            $iTime = 500;
        }
        $self->{timeDelayHelper}->{delay} = $iTime;
        $self->setBasicColorP($self->{gameNotification}->{colorList}->removeAt(0));
}


# throws Exception
sub setNextUnremoveable {
    my ($self) = @_;
        my $index = $self->{circularIndexUtil}->getIndex();
        $self->{string} = $self->{permanentGameNotification}->{stringList}->{objectArray}->[$index];
        $self->{processor} = $self->{nextUnremoveableProcessor};
}


# throws Exception
sub setNextUnremoveableProcess {
    my ($self) = @_;
        my $index = $self->{circularIndexUtil}->getIndex();
        $self->setX(POSIX::floor((($self->{displayInfo}->getLastWidth() - $self->{width})) / (2 ** (1))));
        $self->{point}->setX($self->getX());
        $self->{point}->setY($self->getY());
        my $time = $self->{permanentGameNotification}->{timeList}->{objectArray}->[$index];
        $self->{timeDelayHelper}->{delay} = int($time) * 1000;
        $self->setBasicColorP($self->{permanentGameNotification}->{colorList}->{objectArray}->[$index]);
        $self->{circularIndexUtil}->next();
}


sub clear {
    my ($self) = @_;
        $self->{gameNotification}->clear();
        $self->{permanentGameNotification}->clear();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->SUPER::paintString($graphics, $self->{string});
}
{
    package org::allbinary::game::ag::layer::hud::basic::SetAndRemoveProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{updateMeasurementProcessor} = undef;
    }
    

    sub new {
        my ($class, $updateMeasurementProcessor) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{updateMeasurementProcessor} = $updateMeasurementProcessor;
        return $self;
    }
    

    # throws Exception
    sub process {
        my ($self) = @_;
            $self->{updateMeasurementProcessor}->setAndRemoveProcess();
    }
    }

{
    package org::allbinary::game::ag::layer::hud::basic::NextUnremoveableProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{updateMeasurementProcessor} = undef;
    }
    

    sub new {
        my ($class, $updateMeasurementProcessor) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{updateMeasurementProcessor} = $updateMeasurementProcessor;
        return $self;
    }
    

    # throws Exception
    sub process {
        my ($self) = @_;
            $self->{updateMeasurementProcessor}->setNextUnremoveableProcess();
    }
    }


# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::business::advertisement::GameAdStateFactory;
use org::allbinary::canvas::Processor;
use org::allbinary::game::GameAdState;
use org::allbinary::game::ag::layer::hud::basic::notification::GameNotification;
use org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::graphics::CustomGPoint;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::CircularIndexUtil;

1;

