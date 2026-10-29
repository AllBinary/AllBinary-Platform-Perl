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

package org::allbinary::logic::visual::transform::info::TransformInfoData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{PARENT} = "TRANSFORM_INFO_PARENT";
    $self->{MAPPED} = "TRANSFORM_INFO_MAPPED";
    $self->{NAME} = "TRANSFORM_INFO_NAME";
    $self->{DESCRIPTION} = "TRANSFORM_INFO_DESCRIPTION";
    $self->{CATEGORY} = "TRANSFORM_INFO_CATEGORY";
    $self->{OBJECTFILENAME} = "TRANSFORM_INFO_OBJECTFILENAME";
    $self->{OBJECT} = "TRANSFORM_INFO_OBJECT";
    $self->{OBJECTCONFIGFILENAME} = "TRANSFORM_INFO_OBJECTCONFIGFILENAME";
    $self->{OBJECTCONFIG} = "TRANSFORM_INFO_OBJECTCONFIG";
    $self->{TEMPLATEFILENAME} = "TRANSFORM_INFO_TEMPLATEFILENAME";
    $self->{TEMPLATE} = "TRANSFORM_INFO_TEMPLATE";
    $self->{DATAFILENAME} = "TRANSFORM_INFO_DATAFILENAME";
    $self->{DATA} = "TRANSFORM_INFO_DATA";
    $self->{LABEL} = "TRANSFORM_INFO_LABEL";
    $self->{OWNER} = "OWNER_" . $self->{NAME};
    $self->{PARTIAL} = "PARTIAL_" . $self->{NAME};
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::TransformInfoData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

