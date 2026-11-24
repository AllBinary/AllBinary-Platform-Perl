# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactoryBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j3_1 {
    my ($self, $abeClientInformation, $transformInfoInterface, $objectConfigFileAbPath) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getInstance_j2 {
    my ($self, $abeClientInformation, $transformInfoInterface) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getInstance_j3_2 {
    my ($self, $abeClientInformation, $transformInfoInterface, $document) = @_;
        die ("RuntimeException");
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY'));
    return $invocant->getInstance_j3_2(@arguments);
}

use java::lang::Object ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::allbinary::string::CommonStrings ();
use org::w3c::dom::Document ();
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactoryInterface ();

1;

