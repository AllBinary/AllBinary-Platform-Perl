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

package admin::taghelpers::AuthenticationHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelperFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
    return $self;
}


# throws LicensingException
sub getInstance_j2_1 {
    my ($self, $hashMap, $pageContext) = @_;
        try {
            return 'admin::taghelpers::AuthenticationHelper'->new($hashMap, $pageContext);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}


# throws LicensingException
sub getInstance_j2_2 {
    my ($self, $hashMap, $httpServletRequest) = @_;
        try {
            return 'admin::taghelpers::AuthenticationHelper'->new($hashMap, $httpServletRequest);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{TAGHELPERFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->getInstance_j2_2(@arguments);
}

use java::lang::Object ();
use java::util::HashMap ();
# use javax::servlet::http::HttpServletRequest ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::system::security::licensing::LicensingException ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use admin::taghelpers::TagHelperFactory ();
use admin::taghelpers::AuthenticationHelper ();

1;

