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

package org::allbinary::media::image::analysis::ImageAnalysisResults;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{imageColorRangeResults} = undef;
    $self->{imageColorResults} = undef;
    $self->{averageAmbientLevel} = 0.0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{imageColorRangeResults} = 'org::allbinary::media::image::analysis::ImageColorRangeResults'->new();
        $self->{imageColorResults} = 'org::allbinary::media::image::analysis::ImageColorResults'->new();
    return $self;
}


sub getImageColorRangeResults {
    my ($self) = @_;
        return $self->{imageColorRangeResults};
}


sub setImageColorRangeResults {
    my ($self, $imageColorRangeResults) = @_;
        $self->{imageColorRangeResults} = $imageColorRangeResults;
}


sub getAverageAmbientLevel {
    my ($self) = @_;
        return $self->{averageAmbientLevel};
}


sub setAverageAmbientLevel {
    my ($self, $averageAmbientLevel) = @_;
        $self->{averageAmbientLevel} = $averageAmbientLevel;
}


sub getImageColorResults {
    my ($self) = @_;
        return $self->{imageColorResults};
}


sub setImageColorResults {
    my ($self, $imageColorResults) = @_;
        $self->{imageColorResults} = $imageColorResults;
}

use org::allbinary::media::image::analysis::ImageColorRangeResults;
use org::allbinary::media::image::analysis::ImageColorResults;

1;

