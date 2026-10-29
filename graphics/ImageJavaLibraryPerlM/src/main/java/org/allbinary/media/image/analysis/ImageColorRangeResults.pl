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

package org::allbinary::media::image::analysis::ImageColorRangeResults;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{colorRangeInterface} = undef;
    $self->{matchingPixelsChecked} = 0;
    $self->{totalPixelsChecked} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setColorRangeInterface('org::allbinary::media::image::analysis::ColorRange'->new());
    return $self;
}


sub getColorRangeInterface {
    my ($self) = @_;
        return $self->{colorRangeInterface};
}


sub setColorRangeInterface {
    my ($self, $colorRangeInterface) = @_;
        $self->{colorRangeInterface} = $colorRangeInterface;
}


sub getMatchingPixelsChecked {
    my ($self) = @_;
        return $self->{matchingPixelsChecked};
}


sub setMatchingPixelsChecked {
    my ($self, $matchingPixelsChecked) = @_;
        $self->{matchingPixelsChecked} = $matchingPixelsChecked;
}


sub addMatchingPixelsChecked {
    my ($self) = @_;
        $self->{matchingPixelsChecked}++;
}


sub getTotalPixelsChecked {
    my ($self) = @_;
        return $self->{totalPixelsChecked};
}


sub addTotalPixelsChecked {
    my ($self) = @_;
        $self->{totalPixelsChecked}++;
}


sub setTotalPixelsChecked {
    my ($self, $totalPixelsChecked) = @_;
        $self->{totalPixelsChecked} = $totalPixelsChecked;
}


sub getPercent {
    my ($self) = @_;
        return ($self->getMatchingPixelsChecked() / $self->getTotalPixelsChecked());
}

use org::allbinary::media::image::analysis::ColorRange;

1;

