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

package org::allbinary::logic::visual::dhtml::html::input::HtmlInputData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::dhtml::html::input::HtmlInputData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{TEXT} = "text";
    $self->{RADIO} = "radio";
    $self->{CHECKBOX} = "checkbox";
    $self->{HIDDEN} = "hidden";
    $self->{IMAGE} = "image";
    $self->{PASSWORD} = "password";
    $self->{RESET} = "reset";
    $self->{SUBMIT} = "submit";
    $self->{TYPES} = [$self->{TEXT}, $self->{RADIO}, $self->{CHECKBOX}, $self->{HIDDEN}, $self->{IMAGE}, $self->{PASSWORD}, $self->{RADIO}, $self->{RESET}, $self->{SUBMIT}];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::dhtml::html::input::HtmlInputData::instance;
}


1;

