# Generated Code Do Not Modify

package org::allbinary::game::input::ActivityFractureControllerUtilFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        my $SDK_VERSION = 'org::allbinary::android::AndroidInfoFactory'->getInstance()->getVersion();
        if ($SDK_VERSION <= 8) {
            return 'org::allbinary::game::input::AndroidAPI1KeyFactory'->getInstance();
        } elsif ($SDK_VERSION <= 11) {
            return 'org::allbinary::game::input::AndroidAPI9KeyFactory'->getInstance();
        } else {
            return 'org::allbinary::game::input::AndroidAPI12KeyFactory'->getAPI12Instance();
        }
}

use org::allbinary::android::AndroidInfoFactory;
use org::allbinary::game::input::AndroidAPI12KeyFactory;
use org::allbinary::game::input::AndroidAPI9KeyFactory;
use org::allbinary::game::input::AndroidAPI1KeyFactory;

1;

