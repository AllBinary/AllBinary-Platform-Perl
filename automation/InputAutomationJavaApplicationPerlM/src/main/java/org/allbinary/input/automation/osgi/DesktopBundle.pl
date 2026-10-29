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

package org::allbinary::input::automation::osgi::DesktopBundle;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $DESKTOP_SYMBOLIC_NAME = "org.knopflerfish.bundle.desktop";

sub _init_fields {
    my ($self) = @_;
    $self->{bundle} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $bundleContext = 'bundle::input::automation::InputAutomationBundleActivator'->getBundleContext();
        if (defined($bundleContext)) {
            my $bundleArray = $bundleContext->getBundles();
            for (my $index = 0; $index < scalar(@{$bundleArray}); $index++) {
                my $bundle = $bundleArray->[$index];
                my $symbolicName = $bundle->getSymbolicName();
                if (($symbolicName cmp $org::allbinary::input::automation::osgi::DesktopBundle::DESKTOP_SYMBOLIC_NAME) == 0) {
                    $self->{bundle} = $bundle;
                }
            }
        } else {
            my $textJDialog = 'org::allbinary::gui::dialog::BasicTextJDialog'->new("BundlContext is Null");
            $textJDialog->setVisible(1);
        }
    return $self;
}


# throws Exception
sub start {
    my ($self) = @_;
        $self->{bundle}->start();
}

# use javax::swing;
use org::osgi::framework::Bundle;
use org::osgi::framework::BundleContext;
use bundle::input::automation::InputAutomationBundleActivator;
use org::allbinary::gui::dialog::BasicTextJDialog;

1;

