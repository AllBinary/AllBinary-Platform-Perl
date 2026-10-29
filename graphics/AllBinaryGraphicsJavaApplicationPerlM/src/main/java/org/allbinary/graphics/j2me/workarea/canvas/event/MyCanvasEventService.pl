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

package org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $listenerList = 'javax::swing::event::EventListenerList'->new();
our $DELETE = "delete";
our $DUPLICATE = "duplicate";
our $SELECT = "select";
our $ROTATE = "rotate";
our $EXPLODE = "explode";
our $AUTOEXPLODE = "autoExplode";
our $CENTER = "center";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub addListener {
    my ($class, $listener) = @_;
        $org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::listenerList->add(ref($listener), $listener);
}


sub removeListener {
    my ($class, $listener) = @_;
        $org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::listenerList->remove(ref($listener), $listener);
}


# throws Exception
sub fire {
    my ($class, $evt) = @_;
        my $listeners = $listenerList->getListenerList();
        for (my $i = 0; $i < scalar(@{$listeners}); $i += 2) {
            if ($listeners->[$i] == ref($listeners->[$i + 1])) {
                if ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::DELETE) == 0) {
                    ($listeners->[$i + 1])->delete($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::DUPLICATE) == 0) {
                    ($listeners->[$i + 1])->duplicate($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::SELECT) == 0) {
                    ($listeners->[$i + 1])->select($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::ROTATE) == 0) {
                    ($listeners->[$i + 1])->rotate($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::EXPLODE) == 0) {
                    ($listeners->[$i + 1])->explode($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::AUTOEXPLODE) == 0) {
                    ($listeners->[$i + 1])->autoExplode($evt);
                } elsif ($evt->getCommand()->compareTo($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::CENTER) == 0) {
                    ($listeners->[$i + 1])->center($evt);
                }
            }
        }
}


1;

