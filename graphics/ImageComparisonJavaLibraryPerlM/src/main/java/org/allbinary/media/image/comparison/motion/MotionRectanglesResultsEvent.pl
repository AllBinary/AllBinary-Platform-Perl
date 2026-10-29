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

package org::allbinary::media::image::comparison::motion::MotionRectanglesResultsEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{frame} = undef;
    $self->{motionRectangles} = undef;
}


sub new {
    my ($class, $anyType, $frame, $motionRectangles) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
        $self->{frame} = $frame;
        $self->setMotionRectangles($motionRectangles);
    return $self;
}


sub getMotionRectangles {
    my ($self) = @_;
        return $self->{motionRectangles};
}


sub setMotionRectangles {
    my ($self, $motionRectangles) = @_;
        $self->{motionRectangles} = $motionRectangles;
}


sub getFrame {
    my ($self) = @_;
        return $self->{frame};
}

use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

