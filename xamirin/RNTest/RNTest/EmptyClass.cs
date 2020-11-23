using System;
using Xamarin.UITest.Utils;

namespace RNTest
{
    public class WaitTimes : IWaitTimes
    {
        public TimeSpan GestureWaitTimeout
        {
            get { return TimeSpan.FromMinutes(5); }
        }

        public TimeSpan WaitForTimeout
        {
            get { return TimeSpan.FromMinutes(5); }
        }

        public TimeSpan GestureCompletionTimeout => throw new NotImplementedException();
    }
}
