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

package org::allbinary::media::image::analysis::ImageColorResults;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{colorRange} = undef;
    $self->{colorAverage} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setColorRange('org::allbinary::media::image::analysis::ColorRange'->new());
        $self->getColorRange()->setMaxRed(-1);
        $self->getColorRange()->setMaxGreen(-1);
        $self->getColorRange()->setMaxBlue(-1);
        $self->getColorRange()->setMinRed(256);
        $self->getColorRange()->setMinGreen(256);
        $self->getColorRange()->setMinBlue(256);
        $self->setColorAverage('org::allbinary::media::image::analysis::ColorAverage'->new());
    return $self;
}


sub getColorRange {
    my ($self) = @_;
        return $self->{colorRange};
}


sub setColorRange {
    my ($self, $colorRange) = @_;
        $self->{colorRange} = $colorRange;
}


sub getColorAverage {
    my ($self) = @_;
        return $self->{colorAverage};
}


sub setColorAverage {
    my ($self, $colorAverage) = @_;
        $self->{colorAverage} = $colorAverage;
}

use org::allbinary::media::image::analysis::ColorRange;
use org::allbinary::media::image::analysis::ColorAverage;

1;

