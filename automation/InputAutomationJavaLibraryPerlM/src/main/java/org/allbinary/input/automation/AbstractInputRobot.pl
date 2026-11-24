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

package org::allbinary::input::automation::AbstractInputRobot;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{helpSet} = undef;
}


sub new {
    my ($class, $helpSet) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->setHelpSet($helpSet);
    return $self;
}


sub getHelpSet {
    my ($self) = @_;
        return $self->{helpSet};
}


sub mouseMove_j1 {
    my ($self, $point) = @_;
        $self->mouseMove($point->{x}, $point->{y});
        $self->{logUtil}->putF("Moved Mouse To: x: " . $point->{x} . " y: " . $point->{y}, $self, "moveMouse");
}


# throws Exception
sub mouseMoveToTarget_j3 {
    my ($self, $rectangle, $x, $y) = @_;
        my $point = 'org::allbinary::input::automation::PointHelper'->getCenterPoint($rectangle);
        $self->mouseMove($point->{x} + $x, $point->{y} + $y);
        $self->{logUtil}->putF("Moved Mouse To: x: " . $point->{x} . " y: " . $point->{y} . " in the middle of: " . $rectangle, $self, "moveMouseToTarget");
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


sub mouseMove_j2 {
    my ($self, $x, $y) = @_;
        die ("RuntimeException");
}

sub mouseMove {
    my ($invocant, @arguments) = @_;
    return $invocant->mouseMove_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->mouseMove_j2(@arguments) if scalar(@arguments) == 2;
    die "No method mouseMove takes " . scalar(@arguments) . " arguments";
}


sub setHelpSet {
    my ($self, $helpSet) = @_;
        $self->{helpSet} = $helpSet;
}

use java::lang::Object ();
# use java::awt::Point ();
# use java::awt::Rectangle ();
# use javax::help::HelpSet ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::input::automation::PointHelper ();

1;

