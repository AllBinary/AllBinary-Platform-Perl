# Generated Code Do Not Modify

package org::allbinary::android::ViewSwapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_VIEW_ARRAY = [(undef) x (0)];

sub _init_fields {
    my ($self) = @_;
    $self->{rootViewId} = undef;
    $self->{activity} = undef;
    $self->{currentMainViewId} = -1;
    $self->{mainViewArray} = $org::allbinary::android::ViewSwapper::NULL_VIEW_ARRAY;
    $self->{topViewArray} = $org::allbinary::android::ViewSwapper::NULL_VIEW_ARRAY;
}


sub new {
    my ($class, $activity, $rootViewId) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{activity} = $activity;
        $self->{rootViewId} = $rootViewId;
    return $self;
}


sub setMainViews {
    my ($self, $viewArray) = @_;
        $self->{mainViewArray} = $viewArray;
}


sub setTopViewArray {
    my ($self, $topViewArray) = @_;
        $self->{topViewArray} = $topViewArray;
}


sub setMainView {
    my ($self, $id) = @_;
        my $viewGroup = $self->{activity}->findViewById($self->{rootViewId});
        if ($id != $self->{currentMainViewId}) {
            for (my $index = 0; $index < scalar(@{$self->{topViewArray}}); $index++) {
                $viewGroup->removeView($self->{topViewArray}->[$index]);
            }
            for (my $index = 0; $index < scalar(@{$self->{mainViewArray}}); $index++) {
                if ($id != $self->{mainViewArray}->[$index]->getId()) {
                    $viewGroup->removeView($self->{mainViewArray}->[$index]);
                }
            }
            for (my $index = 0; $index < scalar(@{$self->{mainViewArray}}); $index++) {
                if ($id == $self->{mainViewArray}->[$index]->getId()) {
                    $viewGroup->addView($self->{mainViewArray}->[$index]);
                    $self->{currentMainViewId} = $id;
                }
            }
            for (my $index = 0; $index < scalar(@{$self->{topViewArray}}); $index++) {
                $viewGroup->addView($self->{topViewArray}->[$index]);
            }
        }
}

use android::app::Activity;
use android::view::View;
use android::view::ViewGroup;

1;

