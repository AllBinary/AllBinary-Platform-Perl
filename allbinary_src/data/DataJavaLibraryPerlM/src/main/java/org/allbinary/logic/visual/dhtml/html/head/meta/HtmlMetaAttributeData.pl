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

package org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = undef;
    $self->{name} = undef;
}


sub new {
    my ($class, $id, $value) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $value;
        $self->{id} = $id;
    return $self;
}


sub equals {
    my ($self, $htmlMetaAttributeData) = @_;
        if ($htmlMetaAttributeData->{id} == $self->{id}) {
            return 1;
        } else {
            return 0;
        }
}


sub toString {
    my ($self) = @_;
        return $self->{name};
}


1;

