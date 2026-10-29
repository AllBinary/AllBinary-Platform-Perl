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

package org::allbinary::input::automation::robot::InputRobot;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::robot::InputRobotInterface';

our $NAME = "Java Robot";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{robot} = undef;
}


sub new {
    my ($class, $graphicsDevice) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{robot} = 'org::allbinary::input::automation::robot::Robot'->new($graphicsDevice);
    return $self;
}


sub getName {
    my ($self) = @_;
        return $org::allbinary::input::automation::robot::InputRobot::NAME;
}


sub getHelpSet {
    my ($self) = @_;
        return undef;
}


sub getMousePoint {
    my ($self) = @_;
        my $point = 'org::allbinary::input::automation::robot::MouseInfo'->getPointerInfo()->getLocation();
        return $point;
}


# throws Exception
sub mouseMoveToTarget {
    my ($self, $rectangle, $x, $y) = @_;
        my $point = 'org::allbinary::input::automation::PointHelper'->getCenterPoint($rectangle);
        $self->{robot}->mouseMove($point->{x} + $x, $point->{y} + $y);
        my $message = 'org::allbinary::logic::string::StringMaker'->new()->append("Moved Mouse To: x: ")->appendint(int($point->{x}))->append(" y: ")->appendint(int($point->{y}))->append(" in the middle of: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($rectangle))->toString();
        $self->{logUtil}->putF($message, $self, "moveMouseToTarget");
}


sub mouseMove {
    my ($self, $point) = @_;
        $self->mouseMove($point->{x}, $point->{y});
}


# Java overloaded method: Perl keeps the last definition
sub mouseMove {
    my ($self, $x, $y) = @_;
        $self->{robot}->mouseMove($x, $y);
        my $message = 'org::allbinary::logic::string::StringMaker'->new()->append("Moved Mouse To: x: ")->appendint($x)->append(" y: ")->appendint($y)->toString();
        $self->{logUtil}->putF($message, $self, "moveMouse");
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub mouseMoveToTarget {
    my ($self, $rectangle) = @_;
        $self->mouseMoveToTarget($rectangle, 0, 0);
}


sub createScreenCapture {
    my ($self, $screenRect) = @_;
        return $self->{robot}->createScreenCapture($screenRect);
}


sub delay {
    my ($self, $ms) = @_;
        $self->{robot}->delay($ms);
}


sub getAutoDelay {
    my ($self) = @_;
        return $self->{robot}->getAutoDelay();
}


sub getPixelColor {
    my ($self, $x, $y) = @_;
        return $self->{robot}->getPixelColor($x, $y);
}


sub isAutoWaitForIdle {
    my ($self) = @_;
        return $self->{robot}->isAutoWaitForIdle();
}


sub keyPress {
    my ($self, $keycode) = @_;
        $self->{robot}->keyPress($keycode);
}


sub keyRelease {
    my ($self, $keycode) = @_;
        $self->{robot}->keyRelease($keycode);
}


# Java overloaded method: Perl keeps the last definition
sub mouseMove {
    my ($self, $x, $y) = @_;
        $self->{robot}->mouseMove($x, $y);
}


sub mousePress {
    my ($self, $buttons) = @_;
        $self->{robot}->mousePress($buttons);
}


sub mouseRelease {
    my ($self, $buttons) = @_;
        $self->{robot}->mouseRelease($buttons);
}


sub mouseWheel {
    my ($self, $wheelAmt) = @_;
        $self->{robot}->mouseWheel($wheelAmt);
}


sub setAutoDelay {
    my ($self, $ms) = @_;
        $self->{robot}->setAutoDelay($ms);
}


sub setAutoWaitForIdle {
    my ($self, $isOn) = @_;
        $self->{robot}->setAutoWaitForIdle($isOn);
}


sub toString {
    my ($self) = @_;
        return $self->{robot}->toString();
}


sub waitForIdle {
    my ($self) = @_;
        $self->{robot}->waitForIdle();
}


sub on {
    my ($self) = @_;
}


sub off {
    my ($self) = @_;
}

# use java::awt;
# use java::awt::image::BufferedImage;
# use javax::help::HelpSet;
use org::allbinary::input::automation::PointHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::input::automation::robot::Robot;
use org::allbinary::input::automation::robot::MouseInfo;

1;

