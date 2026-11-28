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

package org::allbinary::input::automation::module::AbstractInputAutomationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef unless exists $self->{name};
    $self->{jPanel} = undef unless exists $self->{jPanel};
    $self->{helpSet} = undef unless exists $self->{helpSet};
}

sub new {
    my ($class, @arguments) = @_;
    return _new3($class, @arguments) if scalar(@arguments) == 3;
    return _new2($class, @arguments) if scalar(@arguments) == 2;
    die "No constructor of AbstractInputAutomationFactory takes " . scalar(@arguments) . " arguments";
}


sub _new3 {
    my ($class, $name, $jPanel, $helpSet) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{name} = $name;
        $self->{jPanel} = $jPanel;
        $self->{helpSet} = $helpSet;
    return $self;
}


sub _new2 {
    my ($class, $name, $jPanel) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{name} = $name;
        $self->{jPanel} = $jPanel;
        my $url = ref($self)->getResource("/help/Help.hs");
        $self->{helpSet} = 'org::allbinary::logic::java::help::JavaHelpUtil'->getInstance()->getHelpSet($url);
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getConfigurationJPanel {
    my ($self) = @_;
        return $self->{jPanel};
}


sub getHelpSet {
    my ($self) = @_;
        return $self->{helpSet};
}

use java::lang::Object ();
# use java::net::URL ();
# use javax::help::HelpSet ();
# use javax::swing::JPanel ();
use org::allbinary::logic::java::help::JavaHelpUtil ();
use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface ();

1;

