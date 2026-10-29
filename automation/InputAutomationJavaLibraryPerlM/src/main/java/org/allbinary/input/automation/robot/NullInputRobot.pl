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

package org::allbinary::input::automation::robot::NullInputRobot;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::AbstractInputRobot','org::allbinary::input::automation::robot::InputRobotInterface';

our $LIBRARY_NAME = "null";
our $NAME = "NULL";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(undef);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getName {
    my ($self) = @_;
        return $org::allbinary::input::automation::robot::NullInputRobot::NAME;
}


sub getHelpSet {
    my ($self) = @_;
        return undef;
}


sub getMousePoint {
    my ($self) = @_;
        return 'org::allbinary::input::automation::PointFactory'->getInstance(0, 0);
}


sub keyPress {
    my ($self, $keycode) = @_;
        $self->{logUtil}->putF("KeyCode: " . $keycode, $self, "keyPress");
}


sub keyRelease {
    my ($self, $keycode) = @_;
        $self->{logUtil}->putF("KeyCode: " . $keycode, $self, "keyRelease");
}


sub mouseMove {
    my ($self, $x, $y) = @_;
        $self->{logUtil}->putF("X: " . $x . " Y: " . $y, $self, "mouseMove");
}


sub mousePress {
    my ($self, $buttons) = @_;
        $self->{logUtil}->putF("Buttons: " . $buttons, $self, "mousePress");
}


sub mouseRelease {
    my ($self, $buttons) = @_;
        $self->{logUtil}->putF("Buttons: " . $buttons, $self, "mouseRelease");
}


sub createScreenCapture {
    my ($self, $screenRect) = @_;
        return undef;
}


sub delay {
    my ($self, $ms) = @_;
}


sub getAutoDelay {
    my ($self) = @_;
        return -1;
}


sub getPixelColor {
    my ($self, $x, $y) = @_;
        return undef;
}


sub isAutoWaitForIdle {
    my ($self) = @_;
        return 0;
}


sub mouseWheel {
    my ($self, $wheelAmt) = @_;
}


sub setAutoDelay {
    my ($self, $ms) = @_;
}


sub setAutoWaitForIdle {
    my ($self, $isOn) = @_;
}


sub toString {
    my ($self) = @_;
        return "DirectXWindowsInputRobot";
}


sub waitForIdle {
    my ($self) = @_;
}

# use java::awt;
# use java::awt::image::BufferedImage;
# use javax::help::HelpSet;
use org::allbinary::input::automation::AbstractInputRobot;
use org::allbinary::input::automation::PointFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::input::automation::robot::InputRobotInterface;

1;

