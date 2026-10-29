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


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{helpSet} = undef;
}


sub new {
    my ($class, $helpSet) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setHelpSet($helpSet);
    return $self;
}


sub getHelpSet {
    my ($self) = @_;
        return $self->{helpSet};
}


sub mouseMove {
    my ($self, $point) = @_;
        $self->mouseMove($point->{x}, $point->{y});
        $self->{logUtil}->putF("Moved Mouse To: x: " . $point->{x} . " y: " . $point->{y}, $self, "moveMouse");
}


# throws Exception
sub mouseMoveToTarget {
    my ($self, $rectangle, $x, $y) = @_;
        my $point = 'org::allbinary::input::automation::PointHelper'->getCenterPoint($rectangle);
        $self->mouseMove($point->{x} + $x, $point->{y} + $y);
        $self->{logUtil}->putF("Moved Mouse To: x: " . $point->{x} . " y: " . $point->{y} . " in the middle of: " . $rectangle, $self, "moveMouseToTarget");
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub mouseMoveToTarget {
    my ($self, $rectangle) = @_;
        $self->mouseMoveToTarget($rectangle, 0, 0);
}


# Java overloaded method: Perl keeps the last definition
sub mouseMove {
    my ($self, $x, $y) = @_;
        die ("RuntimeException");
}


sub setHelpSet {
    my ($self, $helpSet) = @_;
        $self->{helpSet} = $helpSet;
}

# use java::awt;
# use javax::help::HelpSet;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::input::automation::PointHelper;

1;

