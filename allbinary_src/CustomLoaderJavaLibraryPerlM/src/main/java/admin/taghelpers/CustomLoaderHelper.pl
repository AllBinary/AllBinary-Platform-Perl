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

package admin::taghelpers::CustomLoaderHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of CustomLoaderHelper takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getWebappPath {
    my ($self) = @_;
        try {
            return $admin::taghelpers::org::allbinary->{globals}->{URLGLOBALS}->getWebappPath();
        } catch ($e) {
            return undef;
        }
}


# throws Exception
sub setWebappPath {
    my ($self, $path) = @_;
        try {
            my $urlGlobals = 'org::allbinary::globals::AppUrlGlobals'->new();
            $urlGlobals->setWebappPath($path);
            'org::allbinary::globals::URLGLOBALS'->init($urlGlobals);
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setWebappPath()", $e);
            }
        }
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::globals::AppUrlGlobals;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

