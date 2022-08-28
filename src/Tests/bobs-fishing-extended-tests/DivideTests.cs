// *************************************************************
// project:  Bobs Fishing Calculator!!
// *************************************************************

namespace BobsFishing.Calculator.Extended.Tests
{
    using BobsFishing.Calculator.Extended;
    using NUnit.Framework;

    public class DivideTests
    {
        [TestCase(4, 2, 2)]
        [TestCase(5, 1, 1)]
        public void Divide(int a, int b, int expectedResult)
        {
            var entity = new BobsExtendedFishingCalculator();

            Assert.AreEqual(expectedResult, entity.Divide(a, b));
        }
    }
}