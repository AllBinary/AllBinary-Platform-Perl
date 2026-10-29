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

package org::allbinary::logic::visual::transform::info::TransformInfoProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{label} = undef;
    $self->{description} = undef;
    $self->{objectFileName} = undef;
    $self->{objectConfigFileName} = undef;
    $self->{templateFileName} = undef;
}


sub new {
    my ($class, $name, $label, $description, $objectFileName, $objectConfigFileName, $templateFileName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{label} = $label;
        $self->{description} = $description;
        $self->{objectFileName} = $objectFileName;
        $self->{templateFileName} = $templateFileName;
        $self->{objectConfigFileName} = $objectConfigFileName;
    return $self;
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
}


sub setDescription {
    my ($self, $value) = @_;
        $self->{description} = $value;
}


sub setViewFile {
    my ($self, $value) = @_;
        $self->{objectFileName} = $value;
}


sub setTemplateFile {
    my ($self, $value) = @_;
        $self->{templateFileName} = $value;
}


sub setObjectConfigFile {
    my ($self, $value) = @_;
        $self->{objectConfigFileName} = $value;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getLabel {
    my ($self) = @_;
        return $self->{label};
}


sub getDescription {
    my ($self) = @_;
        return $self->{description};
}


sub getViewFile {
    my ($self) = @_;
        return $self->{objectFileName};
}


sub getTemplateFile {
    my ($self) = @_;
        return $self->{templateFileName};
}


sub getObjectConfigFile {
    my ($self) = @_;
        return $self->{objectConfigFileName};
}


1;

