// *************************************************************
// project:  Bobs Fishing Calculator!!
// *************************************************************

namespace BobsFishing.Calculator.Extended.Tests
{
    using BobsFishing.Calculator.Extended;
    using NUnit.Framework;

    public class MultipleTests
    {
        [TestCase(4, 2, 8)]
        [TestCase(5, 1, 5)]
        public void Multiply(int a, int b, int expectedResult)
        {
            var entity = new BobsExtendedFishingCalculator();

            Assert.AreEqual(expectedResult, entity.Multiply(a, b));
        }
    }
}