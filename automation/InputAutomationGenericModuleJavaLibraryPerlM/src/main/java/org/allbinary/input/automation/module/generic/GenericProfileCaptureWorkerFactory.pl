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

package org::allbinary::input::automation::module::generic::GenericProfileCaptureWorkerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $genericProfile) = @_;
        my $vector = $genericProfile->getGenericProfileDataWorkerTypeVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $genericProfileDataWorkerType = $vector->get($index);
            if ($genericProfileDataWorkerType == $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SCREEN_CAPTURE) {
                return 'org::allbinary::input::media::image::capture::ScreenCaptureImagesWorker'->new();
            } elsif ($genericProfileDataWorkerType == $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SAVED_CAPTURE) {
                return 'org::allbinary::input::automation::module::generic::SavedCaptureImagesWorker'->new($genericProfileDataWorkerType);
            }
        }
        die ("No CaptureWorkerInterface specified in GenericProfile");
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType;
use org::allbinary::input::automation::module::generic::configuration::profile::SavedCaptureGenericProfileDataWorkerType;
use org::allbinary::input::media::image::capture::CaptureWorkerInterface;
use org::allbinary::input::media::image::capture::ScreenCaptureImagesWorker;
use org::allbinary::input::automation::module::generic::SavedCaptureImagesWorker;

1;

