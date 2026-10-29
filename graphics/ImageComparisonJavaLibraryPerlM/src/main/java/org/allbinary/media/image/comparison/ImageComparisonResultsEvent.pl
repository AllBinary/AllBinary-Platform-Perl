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

package org::allbinary::media::image::comparison::ImageComparisonResultsEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{imageComparisonResult} = undef;
}


sub new {
    my ($class, $anyType, $imageComparisonInfo) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
        $self->setImageComparisonResult($imageComparisonInfo);
    return $self;
}


sub getImageComparisonResult {
    my ($self) = @_;
        return $self->{imageComparisonResult};
}


sub setImageComparisonResult {
    my ($self, $imageComparisonResult) = @_;
        $self->{imageComparisonResult} = $imageComparisonResult;
}

use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

