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

package org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "BODY_NAME";
    $self->{VIEWNAMEKEY} = "Body";
    $self->{MIN} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData::instance;
}


1;

