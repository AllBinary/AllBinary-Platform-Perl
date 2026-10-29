# Generated Code Do Not Modify

package org::allbinary::business::advertisement::AppNameLicensingAdConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::AdConfiguration';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(['org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}]);
        # super(...) made $self above
    return $self;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::business::advertisement::AdConfiguration;

1;

