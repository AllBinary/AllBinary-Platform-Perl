# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

package org::allbinary::logic::io::file::CommonDataFileStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::CommonDataFileStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{XML} = "xml";
    $self->{_XML} = ".xml";
    $self->{JSON} = "json";
    $self->{_JSON} = ".json";
    $self->{XSL} = "xsl";
    $self->{_XSL} = ".xsl";
    $self->{JAVA} = "java";
    $self->{_JAVA} = ".java";
    $self->{KT} = "kt";
    $self->{_KT} = ".kt";
    $self->{TS} = "ts";
    $self->{_TS} = ".ts";
    $self->{JS} = "js";
    $self->{_JS} = ".js";
    $self->{CPP} = "cpp";
    $self->{_CPP} = ".cpp";
    $self->{H} = "h";
    $self->{_H} = ".h";
    $self->{PY} = "py";
    $self->{_PY} = ".py";
    $self->{GO} = "go";
    $self->{_GO} = ".go";
    $self->{CS} = "cs";
    $self->{_CS} = ".cs";
    $self->{ADB} = "adb";
    $self->{_ADB} = ".adb";
    $self->{ADS} = "ads";
    $self->{_ADS} = ".ads";
    $self->{ADA} = "ada";
    $self->{_ADA} = ".ada";
    $self->{RUST} = "rs";
    $self->{_RUST} = ".rs";
    $self->{C} = "c";
    $self->{_C} = ".c";
    $self->{CSHARP} = "cs";
    $self->{_CSHARP} = ".cs";
    $self->{ERL} = "erl";
    $self->{_ERL} = ".erl";
    $self->{HS} = "hs";
    $self->{_HS} = ".hs";
    $self->{HX} = "hx";
    $self->{_HX} = ".hx";
    $self->{LUA} = "lua";
    $self->{_LUA} = ".lua";
    $self->{PAS} = "pas";
    $self->{_PAS} = ".pas";
    $self->{ML} = "ml";
    $self->{_ML} = ".ml";
    $self->{PL} = "pl";
    $self->{_PL} = ".pl";
    $self->{RB} = "rb";
    $self->{_RB} = ".rb";
    $self->{ZIG} = "zig";
    $self->{_ZIG} = ".zig";
    $self->{UNCRYPTED_EXTENSION} = $self->{XML};
    $self->{ENCRYPTED_EXTENSION} = "abd";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::CommonDataFileStrings::instance;
}


1;

