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

# Java interface
package org::allbinary::input::automation::robot::InputRobotInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub getHelpSet {
    my ($self) = @_;
    die "abstract method getHelpSet";
}


sub createScreenCapture {
    my ($self, $screenRect) = @_;
    die "abstract method createScreenCapture";
}


sub delay {
    my ($self, $ms) = @_;
    die "abstract method delay";
}


sub getAutoDelay {
    my ($self) = @_;
    die "abstract method getAutoDelay";
}


sub getPixelColor {
    my ($self, $x, $y) = @_;
    die "abstract method getPixelColor";
}


sub isAutoWaitForIdle {
    my ($self) = @_;
    die "abstract method isAutoWaitForIdle";
}


sub keyPress {
    my ($self, $keycode) = @_;
    die "abstract method keyPress";
}


sub keyRelease {
    my ($self, $keycode) = @_;
    die "abstract method keyRelease";
}


sub getMousePoint {
    my ($self) = @_;
    die "abstract method getMousePoint";
}


sub mouseMove_j2 {
    my ($self, $x, $y) = @_;
    die "abstract method mouseMove";
}


sub mousePress {
    my ($self, $buttons) = @_;
    die "abstract method mousePress";
}


sub mouseRelease {
    my ($self, $buttons) = @_;
    die "abstract method mouseRelease";
}


sub mouseWheel {
    my ($self, $wheelAmt) = @_;
    die "abstract method mouseWheel";
}


sub setAutoDelay {
    my ($self, $ms) = @_;
    die "abstract method setAutoDelay";
}


sub setAutoWaitForIdle {
    my ($self, $isOn) = @_;
    die "abstract method setAutoWaitForIdle";
}


sub toString {
    my ($self) = @_;
    die "abstract method toString";
}


sub waitForIdle {
    my ($self) = @_;
    die "abstract method waitForIdle";
}


sub mouseMove_j1 {
    my ($self, $point) = @_;
    die "abstract method mouseMove";
}

sub mouseMove {
    my ($invocant, @arguments) = @_;
    return $invocant->mouseMove_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->mouseMove_j1(@arguments) if scalar(@arguments) == 1;
    die "No method mouseMove takes " . scalar(@arguments) . " arguments";
}


# throws Exception
sub mouseMoveToTarget_j1 {
    my ($self, $rectangle) = @_;
    die "abstract method mouseMoveToTarget";
}


# throws Exception
sub mouseMoveToTarget_j3 {
    my ($self, $rectangle, $x, $y) = @_;
    die "abstract method mouseMoveToTarget";
}

sub mouseMoveToTarget {
    my ($invocant, @arguments) = @_;
    return $invocant->mouseMoveToTarget_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->mouseMoveToTarget_j3(@arguments) if scalar(@arguments) == 3;
    die "No method mouseMoveToTarget takes " . scalar(@arguments) . " arguments";
}

# use java::awt::Rectangle ();
# use java::awt::Color ();
# use java::awt::Point ();
# use java::awt::image::BufferedImage ();
# use javax::help::HelpSet ();

1;

