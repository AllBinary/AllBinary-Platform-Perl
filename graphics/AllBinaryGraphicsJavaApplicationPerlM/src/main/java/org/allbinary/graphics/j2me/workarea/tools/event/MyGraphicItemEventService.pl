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

package org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $listenerList = 'javax::swing::event::EventListenerList'->new();
our $DELETE = "delete";
our $DESELECT = "deselect";
our $SELECT = "select";
our $DUPLICATE = "duplicate";
our $ROTATE = "rotate";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub addListener {
    my ($class, $listener) = @_;
        $org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::listenerList->add(ref($listener), $listener);
}


sub removeListener {
    my ($class, $listener) = @_;
        $org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::listenerList->remove(ref($listener), $listener);
}


# throws Exception
sub fire {
    my ($class, $evt) = @_;
        my $listeners = $listenerList->getListenerList();
        for (my $i = 0; $i < scalar(@{$listeners}); $i += 2) {
            if ($listeners->[$i] == ref($listeners->[$i + 1])) {
                if ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::SELECT) == 0) {
                    ($listeners->[$i + 1])->highlight($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::DESELECT) == 0) {
                    ($listeners->[$i + 1])->deselect($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::DELETE) == 0) {
                    ($listeners->[$i + 1])->delete($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::DUPLICATE) == 0) {
                    ($listeners->[$i + 1])->duplicate($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::ROTATE) == 0) {
                    ($listeners->[$i + 1])->rotate($evt);
                }
            }
        }
}


1;

