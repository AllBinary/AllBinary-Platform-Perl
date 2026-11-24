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
use parent -norequire,'java::lang::Object','org::allbinary::input::automation::robot::InputRobotInterface';

our $NAME = "Java Robot";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{robot} = undef;
}


sub new {
    my ($class, $graphicsDevice) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{robot} = 'java::awt::Robot'->new($graphicsDevice);
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
        my $point = 'java::awt::MouseInfo'->getPointerInfo()->getLocation();
        return $point;
}


# throws Exception
sub mouseMoveToTarget_j3 {
    my ($self, $rectangle, $x, $y) = @_;
        my $point = 'org::allbinary::input::automation::PointHelper'->getCenterPoint($rectangle);
        $self->{robot}->mouseMove($point->{x} + $x, $point->{y} + $y);
        my $message = 'org::allbinary::logic::string::StringMaker'->new()->append("Moved Mouse To: x: ")->appendint(int($point->{x}))->append(" y: ")->appendint(int($point->{y}))->append(" in the middle of: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($rectangle))->toString();
        $self->{logUtil}->putF($message, $self, "moveMouseToTarget");
}


sub mouseMove_j1 {
    my ($self, $point) = @_;
        $self->mouseMove($point->{x}, $point->{y});
}


sub mouseMove_j2_1 {
    my ($self, $x, $y) = @_;
        $self->{robot}->mouseMove($x, $y);
        my $message = 'org::allbinary::logic::string::StringMaker'->new()->append("Moved Mouse To: x: ")->appendint($x)->append(" y: ")->appendint($y)->toString();
        $self->{logUtil}->putF($message, $self, "moveMouse");
}


# throws Exception
sub mouseMoveToTarget_j1 {
    my ($self, $rectangle) = @_;
        $self->mouseMoveToTarget($rectangle, 0, 0);
}

sub mouseMoveToTarget {
    my ($invocant, @arguments) = @_;
    return $invocant->mouseMoveToTarget_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->mouseMoveToTarget_j1(@arguments) if scalar(@arguments) == 1;
    die "No method mouseMoveToTarget takes " . scalar(@arguments) . " arguments";
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


sub mouseMove_j2_2 {
    my ($self, $x, $y) = @_;
        $self->{robot}->mouseMove($x, $y);
}

sub mouseMove {
    my ($invocant, @arguments) = @_;
    return $invocant->mouseMove_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->mouseMove_j2(@arguments) if scalar(@arguments) == 2;
    die "No method mouseMove takes " . scalar(@arguments) . " arguments";
}

sub mouseMove_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->mouseMove_j2_1(@arguments) if 1 && !ref($arguments[0]) && !ref($arguments[1]);
    return $invocant->mouseMove_j2_2(@arguments);
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

use java::lang::Object ();
# use java::awt::Robot ();
# use java::awt::GraphicsDevice ();
# use java::awt::MouseInfo ();
# use java::awt::Point ();
# use java::awt::Rectangle ();
# use java::awt::Color ();
# use java::awt::image::BufferedImage ();
# use javax::help::HelpSet ();
use org::allbinary::input::automation::PointHelper ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::input::automation::robot::InputRobotInterface ();

1;

